//
//  UnifiedReceipt.swift
//  
//
//  Created by Paulo Ricardo on 16/11/20.
//

import Vapor
import Fluent

struct UnifiedReceipt: Content {
    let status: Int
    let latestReceipt, environment: String
    let pendingRenewalInfo: [RenewalInfo]
    let latestReceiptInfo: [Receipt]

    enum CodingKeys: String, CodingKey {
        case environment, status
        case latestReceipt = "latest_receipt"
        case pendingRenewalInfo = "pending_renewal_info"
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
