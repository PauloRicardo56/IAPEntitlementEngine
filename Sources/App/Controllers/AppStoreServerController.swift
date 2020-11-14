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
        routes.post("ds") { req in
            
            return HTTPStatus.ok
        }
    }
}
