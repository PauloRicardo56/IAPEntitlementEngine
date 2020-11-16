//
//  Receipt.swift
//  
//
//  Created by Paulo Ricardo on 16/11/20.
//

import Fluent
import Vapor

struct Receipt: Content {
    let quantity,
        expiresDatePst,
        purchaseDate,
        purchaseDateMS,
        originalPurchaseDateMS,
        transactionID,
        originalTransactionID,
        expiresDateMS,
        originalPurchaseDatePst,
        productID,
        subscriptionGroupIdentifier,
        webOrderLineItemID,
        expiresDate,
        isInIntroOfferPeriod,
        originalPurchaseDate,
        purchaseDatePst,
        isTrialPeriod: String

    enum CodingKeys: String, CodingKey {
        case quantity
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
