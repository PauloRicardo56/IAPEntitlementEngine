import Fluent
import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: SubscriptionController())
    try app.register(collection: AppStoreServerController())
    
    app.get("teste") { req in
        return HTTPStatus.ok
    }
}
