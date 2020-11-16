//
//  AppStoreServerController.swift
//  
//
//  Created by Paulo Ricardo on 14/11/20.
//

import Fluent
import Vapor

struct AppStoreServerController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        routes.on(.POST, "ds", body: .collect(maxSize: "1mb")) { req in
            return HTTPStatus.ok
        }
    }
}


//{
//    "notification_type": "DID_RENEW"
//    "environment": "Sandbox"
//    "auto_renew_product_id": "com.QuintetoFantastico.MacroChallenge.sharedbusiness",
//    "auto_renew_status": "true",
//    "bid": "com.QuintetoFantastico.MacroChallenge",
//    "bvrs": "1",
//    "unified_receipt": {
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
//        "latest_receipt": "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"
//    }
//}
