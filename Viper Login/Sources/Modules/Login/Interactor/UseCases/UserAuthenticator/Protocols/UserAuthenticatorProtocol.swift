//
//  UserAuthenticatorProtocol.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 03/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

protocol UserAuthenticatorProtocol {
    typealias AuthenticationResult = Result<User, UserAuthenticationRequestError>

    func authenticate(email: String, password: String) -> AuthenticationResult
}
