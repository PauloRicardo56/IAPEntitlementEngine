import Fluent
import Vapor

final class Subscription: Model, Content {
    static let schema = "subscriptions"
    
    @ID(key: .id)
    var id: UUID?
    
    @OptionalField(key: "auto_renew_adam_id")
    var auto_renew_adam_id: String?
    
    @Field(key: "auto_renew_product_id")
    var auto_renew_product_id: String
    
    @OptionalField(key: "auto_renew_status")
    var auto_renew_status: String?
    
    @OptionalField(key: "auto_renew_status_change_date")
    var auto_renew_status_change_date: String?
    
    @OptionalField(key: "auto_renew_status_change_date_ms")
    var auto_renew_status_change_date_ms: String?
    
    @OptionalField(key: "auto_renew_status_change_date_pst")
    var auto_renew_status_change_date_pst: String?
    
    @Field(key: "environment")
    var environment: String
    
    @OptionalField(key: "expiration_intent")
    var expiration_intent: Int?

    @Field(key: "notification_type")
    var notification_type: String
    
    @OptionalField(key: "password")
    var password: String?
    
    @Children(for: \.$subscription)
    var unified_receipt: UnifiedReceipt
    
    @Field(key: "bid")
    var bid: String
    
    @Field(key: "bvrs")
    var bvrs: String
    
    @OptionalField(key: "original_transaction_id")
    var originalTransactionID: String?
    
    init() { }

    init(
        id: UUID? = nil,
        auto_renew_adam_id: String?,
        auto_renew_product_id: String,
        auto_renew_status: String?,
        auto_renew_status_change_date: String?,
        auto_renew_status_change_date_ms: String?,
        auto_renew_status_change_date_pst: String?,
        environment: String,
        expiration_intent: Int?,
        notification_type: String,
        password: String?,
        unified_receipt: UnifiedReceipt,
        bid: String,
        bvrs: String
    ) {
        self.id = id
        self.auto_renew_adam_id = auto_renew_adam_id
        self.auto_renew_product_id = auto_renew_product_id
        self.auto_renew_status = auto_renew_status
        self.auto_renew_status_change_date = auto_renew_status_change_date
        self.auto_renew_status_change_date_ms = auto_renew_status_change_date_ms
        self.auto_renew_status_change_date_pst = auto_renew_status_change_date_pst
        self.environment = environment
        self.expiration_intent = expiration_intent
        self.notification_type = notification_type
        self.password = password
        self.unified_receipt = unified_receipt
        self.bid = bid
        self.bvrs = bvrs
    }
    
    func afterDecode() throws {
        self.originalTransactionID = unified_receipt.latest_receipt_info.first?.originalTransactionID
    }
}
