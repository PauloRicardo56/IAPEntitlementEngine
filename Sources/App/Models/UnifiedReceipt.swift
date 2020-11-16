//
//  UnifiedReceipt.swift
//  
//
//  Created by Paulo Ricardo on 16/11/20.
//

import Fluent
import Vapor

final class UnifiedReceipt: Model, Content {
    static let schema = "unifiedreceipts"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "subscription_id")
    var subscription: Subscription?
    
    @Field(key: "status")
    var status: Int
    
    @Field(key: "latest_receipt")
    var latest_receipt: String
    
    @Field(key: "environment")
    var environment: String
    
    @Field(key: "pending_renewal_info")
    var pending_renewal_info: [RenewalInfo]
    
    @Field(key: "latest_receipt_info")
    var latest_receipt_info: [Receipt]
    
    init() {}
    
    init(
        id: UUID? = nil,
        status: Int,
        latest_receipt: String,
        environment: String,
        pending_renewal_info: [RenewalInfo],
        latest_receipt_info: [Receipt]
    ) {
        self.id = id
        self.status = status
        self.latest_receipt = latest_receipt
        self.environment = environment
        self.pending_renewal_info = pending_renewal_info
        self.latest_receipt_info = latest_receipt_info
    }
}

struct RenewalInfo: Content {
    let autoRenewStatus, autoRenewProductID, productID, originalTransactionID: String
    
    enum CodingKeys: String, CodingKey {
        case autoRenewStatus = "auto_renew_status"
        case autoRenewProductID = "auto_renew_product_id"
        case productID = "product_id"
        case originalTransactionID = "original_transaction_id"
    }
}
