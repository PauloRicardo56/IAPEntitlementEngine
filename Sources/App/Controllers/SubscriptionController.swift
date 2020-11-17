import Fluent
import Vapor

struct SubscriptionController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let subscriptions = routes.grouped("subscription")
        subscriptions.get(use: index)
        subscriptions.post(use: create)
        subscriptions.group(":subscriptionID") { subscription in
            subscription.delete(use: delete)
        }
        
        let unifiedReceipt = routes.grouped("unified_receipt")
        unifiedReceipt.get("last", ":originalTransactionID") { req -> EventLoopFuture<[UnifiedReceipt]> in
            Subscription.query(on: req.db)
                .field(\.$originalTransactionID)
                .filter(\.$originalTransactionID == req.parameters.get("originalTransactionID"))
                .all(\.$unified_receipt)
        }
    }
    
    func getLatestReceipt(req: Request) -> EventLoopFuture<[Subscription]> {
        Subscription.query(on: req.db)
            .field(\.$unified_receipt)
            .filter(\.$originalTransactionID == req.parameters.get("originalTransactionID"))
            .all()
    }

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
