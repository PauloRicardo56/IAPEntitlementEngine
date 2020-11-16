//
//  UnifiedReceipt.swift
//  
//
//  Created by Paulo Ricardo on 16/11/20.
//

import Vapor
import Fluent

struct UnifiedReceipt: Content {
    let latestReceipt: String
    let pendingRenewalInfo: [RenewalInfo]
    let environment: String
    let status: Int
    let latestReceiptInfo: [Receipt]

    enum CodingKeys: String, CodingKey {
        case latestReceipt = "latest_receipt"
        case pendingRenewalInfo = "pending_renewal_info"
        case environment, status
        case latestReceiptInfo = "latest_receipt_info"
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
