//
//  CreateUnifiedReceipt.swift
//  
//
//  Created by Paulo Ricardo on 16/11/20.
//
import Fluent

struct CreateUnifiedReceipt: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("unifiedreceipts")
            .id()
            .field("subscription_id", .uuid, .required, .references("subscriptions", "id"))
            .field("status", .string, .required)
            .field("latest_receipt", .string, .required)
            .field("environment", .string, .required)
            .field("pending_renewal_info", .string, .required)
            .field("latest_receipt_info", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("unifiedreceipts").delete()
    }
}
