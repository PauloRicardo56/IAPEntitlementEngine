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

//"unified_receipt": {
//        "status": 0,
//        "environment": "Sandbox",
//        "latest_receipt_info": [
//            {
//                "quantity": "1",
//                "product_id":  "com.QuintetoFantastico.MacroChallenge.sharedbusiness",
//                "transaction_id": "1000000742037931",
//                "purchase_date": "2020-11-15 03:31:03 Etc/GMT",
//                "purchase_date_ms": "1605411063000",
//                "purchase_date_pst": "2020-11-14 19:31:03 America/Los_Angeles",
//                "original_purchase_date": "2020-11-15 03:26:05 Etc/GMT",
//                "original_purchase_date_ms": "1605410765000",
//                "original_purchase_date_pst": "2020-11-14 19:26:05 America/Los_Angeles",
//                "expires_date": "2020-11-15 03: 36: 03 Etc/GMT",
//                "expires_date_ms": "1605411363000",
//                "expires_date_pst": "2020-11-14 19:36:03 America/Los_Angeles",
//                "web_order_line_item_id": "1000000057404390",
//                "is_trial_period": "false",
//                "is_in_intro_offer_period": "false",
//                "original_transaction_id": "1000000742037455",
//                "subscription_group_identifier": "20708206"
//            },
//            {
//                "quantity": "1",
//                "product_id": "com.QuintetoFantastico.MacroChallenge.sharedbusiness",
//                "transaction_id": "1000000742037455",
//                "purchase_date": "2020-11-15 03:26:03 Etc/GMT",
//                "purchase_date_ms": "1605410763000",
//                "purchase_date_pst": "2020-11-14 19:26:03 America/Los_Angeles",
//                "original_purchase_date": "2020-11-15 03:26:05 Etc/GMT",
//                "original_purchase_date_ms": "1605410765000",
//                "original_purchase_date_pst": "2020-11-14 19:26:05 America/Los_Angeles",
//                "expires_date": "2020-11-15 03:31:03 Etc/GMT",
//                "expires_date_ms": "1605411063000",
//                "expires_date_pst": "2020-11-14 19:31:03 America/Los_Angeles",
//                "web_order_line_item_id": "1000000057404389",
//                "is_trial_period": "false",
//                "is_in_intro_offer_period": "false",
//                "original_transaction_id": "1000000742037455",
//                "subscription_group_identifier": "20708206"
//            }
//        ],
//        "pending_renewal_info": [
//            {
//                "auto_renew_status": "1",
//                "auto_renew_product_id": "com.QuintetoFantastico.MacroChallenge.sharedbusiness",
//                "product_id": "com.QuintetoFantastico.MacroChallenge.sharedbusiness",
//                "original_transaction_id": "1000000742037455"
//            }
//        ],
