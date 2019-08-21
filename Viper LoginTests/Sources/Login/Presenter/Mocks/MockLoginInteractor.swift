//
//  MockLoginInteractor.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Foundation

@testable import Viper_Login

final class MockLoginInteractor: LoginInteractorProtocol {
    private(set) var isAuthenticateUserCalled = false

    var stubResult: AuthenticationResult?

    func authenticateUser(email: String?, password: String?, completionBlock: @escaping AuthenticationCompletionBlock) {
        isAuthenticateUserCalled = true
        if let stubResult = stubResult {
            completionBlock(stubResult)
        }
    }
}
