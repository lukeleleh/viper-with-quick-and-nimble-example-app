//
//  MockUserRepositoryMapper.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

@testable import Viper_Login

final class MockUserRepositoryMapper: UserRepositoryMapperProtocol {

    var stubUser = User(fullName: "any", email: "any")
    var stubUserRepositoryError = UserRepositoryError.badCredentials

    func map(userResponse: UserResponse) -> User {
        return stubUser
    }

    func map(userDataSourceError: UserDataSourceError) -> UserRepositoryError {
        return stubUserRepositoryError
    }
    
}
