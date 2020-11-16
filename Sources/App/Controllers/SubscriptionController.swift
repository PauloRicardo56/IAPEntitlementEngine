import Fluent
import Vapor

struct SubscriptionController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let subscriptions = routes.grouped("subscription")
        subscriptions.get(use: index)
        subscriptions.post(use: create)
        subscriptions.group(":subscriptionID") { subscription in
            subscription.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Subscription]> {
        return Subscription.query(on: req.db).all()
    }

    func create(req: Request) throws -> HTTPStatus {
        do {
            let subscription = try req.content.decode(Subscription.self)
            let _ = subscription.save(on: req.db).map { subscription }
            return .ok
        } catch(let e) {
            print(e)
            return .badRequest
        }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Subscription.find(req.parameters.get("subscriptionID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
