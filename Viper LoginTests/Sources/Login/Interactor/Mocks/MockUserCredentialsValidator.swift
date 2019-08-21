//
//  MockUserCredentialsValidator.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

@testable import Viper_Login

final class MockUserCredentialsValidator: UserCredentialsValidatorProtocol {

    var stubResult: ValidationResult!

    func validate(email: String?, password: String?) -> ValidationResult {
        return stubResult
    }

}
