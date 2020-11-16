//
//  Receipt.swift
//  
//
//  Created by Paulo Ricardo on 16/11/20.
//

import Fluent
import Vapor


struct Receipt: Content {
    let expiresDatePst, purchaseDate, purchaseDateMS, originalPurchaseDateMS: String
    let transactionID, originalTransactionID, quantity, expiresDateMS: String
    let originalPurchaseDatePst, productID: String
    let subscriptionGroupIdentifier, webOrderLineItemID, expiresDate, isInIntroOfferPeriod: String
    let originalPurchaseDate, purchaseDatePst, isTrialPeriod: String

    enum CodingKeys: String, CodingKey {
        case quantity = "quantity"
        case expiresDatePst = "expires_date_pst"
        case purchaseDate = "purchase_date"
        case purchaseDateMS = "purchase_date_ms"
        case originalPurchaseDateMS = "original_purchase_date_ms"
        case transactionID = "transaction_id"
        case originalTransactionID = "original_transaction_id"
        case expiresDateMS = "expires_date_ms"
        case originalPurchaseDatePst = "original_purchase_date_pst"
        case productID = "product_id"
        case subscriptionGroupIdentifier = "subscription_group_identifier"
        case webOrderLineItemID = "web_order_line_item_id"
        case expiresDate = "expires_date"
        case isInIntroOfferPeriod = "is_in_intro_offer_period"
        case originalPurchaseDate = "original_purchase_date"
        case purchaseDatePst = "purchase_date_pst"
        case isTrialPeriod = "is_trial_period"
    }
}


//"quantity": "1",
//"product_id":  "com.QuintetoFantastico.MacroChallenge.sharedbusiness",
//"transaction_id": "1000000742037931",
//"purchase_date": "2020-11-15 03:31:03 Etc/GMT",
//"purchase_date_ms": "1605411063000",
//"purchase_date_pst": "2020-11-14 19:31:03 America/Los_Angeles",
//"original_purchase_date": "2020-11-15 03:26:05 Etc/GMT",
//"original_purchase_date_ms": "1605410765000",
//"original_purchase_date_pst": "2020-11-14 19:26:05 America/Los_Angeles",
//"expires_date": "2020-11-15 03: 36: 03 Etc/GMT",
//"expires_date_ms": "1605411363000",
//"expires_date_pst": "2020-11-14 19:36:03 America/Los_Angeles",
//"web_order_line_item_id": "1000000057404390",
//"is_trial_period": "false",
//"is_in_intro_offer_period": "false",
//"original_transaction_id": "1000000742037455",
//"subscription_group_identifier": "20708206"
