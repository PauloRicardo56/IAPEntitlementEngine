//
//  SubscriptionValidation.swift
//  
//
//  Created by Paulo Ricardo on 18/11/20.
//

import Vapor

/// {
///     "isValid": true,
///     "expirationDate": "16028789654320"
/// }
struct SubscriptionValidation: Content {
    let isValid: Bool
    let expirationDate: String
}
