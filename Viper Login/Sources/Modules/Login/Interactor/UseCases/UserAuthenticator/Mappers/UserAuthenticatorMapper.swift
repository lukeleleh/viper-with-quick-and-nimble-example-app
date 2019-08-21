//
//  UserAuthenticatorMapper.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 19/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

protocol UserAuthenticatorMapperProtocol {
    func map(userRepositoryError: UserRepositoryError) -> UserAuthenticationRequestError
}

final class UserAuthenticatorMapper: UserAuthenticatorMapperProtocol {
    func map(userRepositoryError: UserRepositoryError) -> UserAuthenticationRequestError {
        let error: UserAuthenticationRequestError

        switch userRepositoryError {
        case .badCredentials:
            error = .badCredentials
        }

        return error
    }
}

