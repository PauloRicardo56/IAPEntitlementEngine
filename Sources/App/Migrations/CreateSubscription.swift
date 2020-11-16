import Fluent

struct CreateSubscription: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("subscriptions")
            .id()
            .field("notification_type", .string, .required)
            .field("environment", .string, .required)
            .field("auto_renew_product_id", .string, .required)
            .field("auto_renew_status", .string, .required)
            .field("bid", .string, .required)
            .field("bvrs", .string, .required)
            .field("auto_renew_status_change_date", .string, .required)
            .field("auto_renew_status_change_date_ms", .string, .required)
            .field("auto_renew_status_change_date_pst", .string, .required)
            .field("unified_receipt", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("subscriptions").delete()
    }
}

//@Field(key: "auto_renew_status_change_date")
//var auto_renew_status_change_date: String
//
//@Field(key: "auto_renew_status_change_date_ms")
//var auto_renew_status_change_date_ms: String
//
//@Field(key: "auto_renew_status_change_date_pst")
//var auto_renew_status_change_date_pst: String
