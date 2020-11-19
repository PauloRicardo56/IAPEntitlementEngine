import Fluent
import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: SubscriptionController())
    
    app.get("test") { (req) in
        Subscription.query(on: req.db).all()
    }
}
