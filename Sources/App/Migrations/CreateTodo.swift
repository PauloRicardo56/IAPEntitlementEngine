import Fluent

struct CreateSubscription: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("subscriptions")
            .id()
            .field("original_transaction_id", .string, .required)
            .field("subscription_status", .string, .required)
            .field("purchase_date", .string, .required)
            .field("product_id", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("subscriptions").delete()
    }
}
