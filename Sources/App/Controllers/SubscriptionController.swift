import Fluent
import Vapor

struct SubscriptionController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let subscriptions = routes.grouped("subscription")
        subscriptions.get("validate", ":originalTransactionID", use: validateSubscription)
        subscriptions.on(.POST, body: .collect(maxSize: "300kb"), use: updateSubscription)
    }
    
    // MARK: - Methods
    private func validateSubscription(req: Request) -> EventLoopFuture<SubscriptionValidation> {
        let transactionID = req.parameters.get("originalTransactionID")
        
        return SubscriptionQueries.getUnifiedReceipt(from: transactionID, req: req)
            .map { receipts in
                guard let lastTransaction = receipts.first?.latest_receipt_info.first else {
                    return .init(isValid: false, expirationDate: "")
                }
                
                let isValid = compareCurrentDate(with: lastTransaction.expiresDateMS)
                return .init(isValid: isValid, expirationDate: lastTransaction.expiresDateMS)
            }
    }
    
    /// Returns true if expiration date is greater than current date
    /// - Parameter expirationDate: expiration date in ms from unified receipt
    private func compareCurrentDate(with expirationDate: String) -> Bool {
        
        /// ex: 1605733416.213297 -> 1605733416213.297
        let currDateMS = Date().timeIntervalSince1970 * 1000
        /// ex: "1605732074000" -> 1605732074000.0
        let expirationDate = Double(expirationDate) ?? 0.0
        return expirationDate > currDateMS
    }
    
    /// Receive new subscription update from app store server
    func updateSubscription(req: Request) throws -> HTTPStatus {
        do {
            let subscription = try req.content.decode(Subscription.self)
            let _ = SubscriptionQueries.get(from: subscription.originalTransactionID, req: req)
                .map { existingSubscription in
                    if existingSubscription != nil {
                        let _ = existingSubscription?.delete(on: req.db)
                    }
                    let _ = subscription.save(on: req.db)
                }
            return .ok
        } catch {
            return .badRequest
        }
    }
}

extension Bool: Content {}
