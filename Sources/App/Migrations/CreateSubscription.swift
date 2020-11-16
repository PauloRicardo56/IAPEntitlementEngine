import Fluent

struct CreateSubscription: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("subscriptions")
            .id()
            .field("auto_renew_adam_id", .string)
            .field("auto_renew_product_id", .string, .required)
            .field("auto_renew_status", .string)
            .field("auto_renew_status_change_date", .string)
            .field("auto_renew_status_change_date_ms", .string)
            .field("auto_renew_status_change_date_pst", .string)
            .field("environment", .string, .required)
            .field("expiration_intent", .int)
            .field("notification_type", .string, .required)
            .field("password", .string)
            .field("unified_receipt", .string, .required)
            .field("bid", .string, .required)
            .field("bvrs", .string, .required)
            .field("original_transaction_id", .string)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("subscriptions").delete()
    }
}
