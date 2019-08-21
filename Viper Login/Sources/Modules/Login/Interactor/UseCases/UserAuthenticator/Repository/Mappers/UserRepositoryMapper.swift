//
//  UserRepositoryMapper.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 19/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

protocol UserRepositoryMapperProtocol {
    func map(userResponse: UserResponse) -> User
    func map(userDataSourceError: UserDataSourceError) -> UserRepositoryError
}

final class UserRepositoryMapper: UserRepositoryMapperProtocol {
    func map(userResponse: UserResponse) -> User {
        let fullName = "\(userResponse.firstName) \(userResponse.lastName)"
        return User(fullName: fullName, email: userResponse.email)
    }

    func map(userDataSourceError: UserDataSourceError) -> UserRepositoryError {
        let error: UserRepositoryError

        switch userDataSourceError {
        case .badCredentials:
            error = .badCredentials
        }

        return error
    }
}
