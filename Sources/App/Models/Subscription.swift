import Fluent
import Vapor

final class Subscription: Model, Content {
    static let schema = "subscriptions"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "original_transaction_id")
    var original_transaction_id: String
    
    @Field(key: "subscription_status")
    var subscription_status: String
    
    @Field(key: "purchase_date")
    var purchase_date: String
    
    @Field(key: "product_id")
    var product_id: String
    
    init() { }

    init(
        id: UUID? = nil,
        original_transaction_id: String,
        subscription_status: String,
        purchase_date: String,
        product_id: String
    ) {
        self.id = id
        self.original_transaction_id = original_transaction_id
        self.subscription_status = subscription_status
        self.purchase_date = purchase_date
        self.properties = product_id
    }
}
