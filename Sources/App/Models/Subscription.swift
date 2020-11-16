import Fluent
import Vapor

final class Subscription: Model, Content {
    static let schema = "subscriptions"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "notification_type")
    var notification_type: String
    
    @Field(key: "environment")
    var environment: String
    
    @Field(key: "auto_renew_product_id")
    var auto_renew_product_id: String
    
    @Field(key: "auto_renew_status")
    var auto_renew_status: String
    
    @Field(key: "bid")
    var bid: String
    
    @Field(key: "bvrs")
    var bvrs: String
    
    // TODO: Transaction
    @Field(key: "unified_receipt")
    var unified_receipt: [Transaction]
    
    init() { }

    init(
        id: UUID? = nil,
        notification_type: String,
        environment: String,
        auto_renew_product_id: String,
        auto_renew_status: String,
        bid: String,
        bvrs: String,
        unified_receipt: [Transaction]
    ) {
        self.id = id
        self.notification_type = notification_type
        self.environment = environment
        self.auto_renew_product_id = auto_renew_product_id
        self.auto_renew_status = auto_renew_status
        self.bid = bid
        self.bvrs = bvrs
        self.unified_receipt = unified_receipt
    }
}


//"notification_type": "DID_RENEW"
//"environment": "Sandbox"
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
//        "latest_receipt":
