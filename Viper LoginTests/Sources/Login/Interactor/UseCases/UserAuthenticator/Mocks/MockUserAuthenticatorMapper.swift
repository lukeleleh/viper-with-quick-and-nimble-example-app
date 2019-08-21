//
//  MockUserAuthenticatorMapper.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

@testable import Viper_Login

final class MockUserAuthenticatorMapper: UserAuthenticatorMapperProtocol {

    var stubUserAuthenticationRequestError = UserAuthenticationRequestError.badCredentials

    func map(userRepositoryError: UserRepositoryError) -> UserAuthenticationRequestError {
        return stubUserAuthenticationRequestError
    }

}

