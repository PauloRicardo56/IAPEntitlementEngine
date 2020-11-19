//
//  SubscriptionQueries.swift
//  
//
//  Created by Paulo Ricardo on 19/11/20.
//

import Vapor
import Fluent

final class SubscriptionQueries {
    
    // MARK: - CREATE
    
    // MARK: - READ
    class func getUnifiedReceipt(
        from transactionID: String?,
        req: Request
    ) -> EventLoopFuture<[UnifiedReceipt]> {
        Subscription.query(on: req.db)
            .field(\.$originalTransactionID)
            .filter(\.$originalTransactionID == transactionID)
            .all(\.$unified_receipt)
    }
    
    class func get(
        from transactionID: String?,
        req: Request
    ) -> EventLoopFuture<Subscription?> {
        Subscription.query(on: req.db)
            .filter(\.$originalTransactionID == transactionID)
            .first()
    }
    
    class func getAll(req: Request) -> EventLoopFuture<[Subscription]> {
        Subscription.query(on: req.db)
            .all()
    }
    
    // MARK: - UPDATE
    
    // MARK: - DELETE
}
