//
//  UserCredentialsValidator.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 03/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

struct UserCredentialsValidator: UserCredentialsValidatorProtocol {

    func validate(email: String?, password: String?) -> ValidationResult {
        let email = email ?? ""
        let password = password ?? ""

        let validationErrors: UserCredentialsValidationError = [
            isEmailValid(email),
            isPasswordValid(password)
        ]

        guard validationErrors.isEmpty else {
            return .failure(validationErrors)
        }

        let userCredentials = UserCredentials(email: email, password: password)

        return .success(userCredentials)
    }

}

private extension UserCredentialsValidator {

    func isEmailValid(_ value: String) -> UserCredentialsValidationError {
        guard !value.isEmpty else {
            return .invalidEmail
        }

        return []
    }

    func isPasswordValid(_ value: String) -> UserCredentialsValidationError {
        guard !value.isEmpty else {
            return .invalidPassword
        }

        return []
    }

}
