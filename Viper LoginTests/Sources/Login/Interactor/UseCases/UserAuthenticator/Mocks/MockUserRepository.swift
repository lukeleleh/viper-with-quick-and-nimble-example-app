//
//  MockUserRepository.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Foundation

@testable import Viper_Login

final class MockUserRepository: UserRepositoryProtocol {

    var stubResult: AuthenticationResult!

    func authenticate(email: String, password: String) -> AuthenticationResult {
        return stubResult
    }
    
}
