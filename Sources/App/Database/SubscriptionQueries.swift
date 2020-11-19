//
//  SubscriptionQueries.swift
//  
//
//  Created by Paulo Ricardo on 19/11/20.
//

import Vapor
import Fluent

final class SubscriptionQueries {
    
    // MARK: - GET
    static func getUnifiedReceipt(from transactionID: String?, req: Request) -> EventLoopFuture<[UnifiedReceipt]> {
        Subscription.query(on: req.db)
            .field(\.$originalTransactionID)
            .filter(\.$originalTransactionID == transactionID)
            .all(\.$unified_receipt)
    }
    
    // MARK: - POST
}
