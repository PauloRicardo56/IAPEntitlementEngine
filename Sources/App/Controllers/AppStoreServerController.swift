//
//  AppStoreServerController.swift
//  
//
//  Created by Paulo Ricardo on 14/11/20.
//

import Fluent
import Vapor

struct AppStoreServerController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        routes.on(.POST, "ds", body: .collect(maxSize:  "10mb")) { req -> HTTPStatus in
            do {
                let subscription = try req.content.decode(Subscription.self)
                let _ = subscription.save(on: req.db).map { subscription }
            } catch(let e) {
                return .badRequest
            }
            return .ok
        }
    }
}
