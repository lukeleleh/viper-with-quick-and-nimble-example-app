//
//  UserMapper.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 19/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

enum UserRepositoryMapper {
    static func map(userResponse: UserResponse) -> User {
        return User(name: userResponse.firstName, email: userResponse.email)
    }

    static func map(userDataSourceError: UserDataSourceError) -> UserRepositoryError {
        let error: UserRepositoryError

        switch userDataSourceError {
        case .badCredentials:
            error = .badCredentials
        }

        return error
    }
}
