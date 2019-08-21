//
//  UserDataSourceProtocol.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 19/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

protocol UserDataSourceProtocol {
    typealias AuthenticationResult = Result<UserResponse, UserDataSourceError>

    func authenticate(email: String, password: String) -> AuthenticationResult
}
