//
//  MockUserAuthenticator.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

@testable import Viper_Login

final class MockUserAuthenticator: UserAuthenticatorProtocol {

    private(set) var isAuthenticateCalled = false

    var stubResult: AuthenticationResult!

    func authenticate(email: String, password: String) -> AuthenticationResult {
        isAuthenticateCalled = true
        return stubResult
    }
}
