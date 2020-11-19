import Fluent
import Vapor

struct SubscriptionController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let subscriptions = routes.grouped("subscription")
        subscriptions.get(use: index)
        subscriptions.on(.POST, body: .collect(maxSize: "300kb"), use: create)
        subscriptions.group(":subscriptionID") { subscription in
            subscription.delete(use: delete)
        }
        
        let validateReceipt = routes.grouped("validateSubscription")
        validateReceipt.get(":originalTransactionID", use: validateSubscription)
    }
    
    private func validateSubscription(req: Request) -> EventLoopFuture<SubscriptionValidation> {
        let transactionID = req.parameters.get("originalTransactionID")
        
        return SubscriptionQueries.getUnifiedReceipt(from: transactionID, req: req)
            .map { receipts in
                guard let lastTransaction = receipts.first?.latest_receipt_info.first else {
                    return .init(isValid: false, expirationDate: "")
                }
                
                /// ex: 1605733416.213297 -> 1605733416213.297
                let currDateMS = Date().timeIntervalSince1970 * 1000
                /// ex: "1605732074000" -> 1605732074000.0
                let expirationDate = Double(lastTransaction.expiresDateMS) ?? 0.0
                let isValid = expirationDate > currDateMS
                return .init(isValid: isValid, expirationDate: lastTransaction.expiresDateMS)
            }
    }
    
//    private func getUnifiedReceipt(from id: String?, req: Request) -> EventLoopFuture<[UnifiedReceipt]> {
//        Subscription.query(on: req.db)
//            .field(\.$originalTransactionID)
//            .filter(\.$originalTransactionID == id)
//            .all(\.$unified_receipt)
//    }

    func index(req: Request) throws -> EventLoopFuture<[Subscription]> {
        return Subscription.query(on: req.db).all()
    }
    
    func get(req: Request, transactionID: String?) -> EventLoopFuture<Subscription?> {
        return Subscription.query(on: req.db)
            .filter(\.$originalTransactionID == transactionID)
            .first()
    }

    func create(req: Request) throws -> HTTPStatus {
        do {
            let subscription = try req.content.decode(Subscription.self)
            let _ = get(req: req, transactionID: subscription.originalTransactionID).map { existingSubscription in
                if existingSubscription != nil {
                    let _ = existingSubscription?.delete(on: req.db)
                }
                let _ = subscription.save(on: req.db)
            }
            return .ok
        } catch(let e) {
            print(e)
            return .badRequest
        }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Subscription.find(req.parameters.get("subscriptionID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}

extension Bool: Content {}
