//
//  UserAuthenticationError.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 03/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Foundation

enum UserAuthenticationError: Error {
    case validation(UserCredentialsValidationError)
    case authentication(UserAuthenticationRequestError)
}
