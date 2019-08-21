//
//  AuthenticationResultMapper.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

protocol AuthenticationResultMapperProtocol {
    func map(from result: LoginInteractor.AuthenticationResult) -> String
}

final class AuthenticationResultMapper: AuthenticationResultMapperProtocol {
    func map(from result: LoginInteractor.AuthenticationResult) -> String {
        let alertMessage: String

        switch result {
        case let .success(user):
            alertMessage = map(user: user)
        case let .failure(error):
            alertMessage = map(authenticationError: error)
        }

        return alertMessage
    }
}

private extension AuthenticationResultMapper {
    enum Constants {
        static let terminatorCharacter = "\n"
    }

    func map(user: User) -> String {
        let message = String(format: "login_authentication_success_message".localized, user.fullName)
        return message
    }

    func map(authenticationError: UserAuthenticationError) -> String {
        let message: String

        switch authenticationError {
        case let .validation(error):
            message = map(credentialsValidationError: error)
        case let .authentication(error):
            message = map(userAuthenticationRequestError: error)
        }

        return message
    }

    func map(credentialsValidationError: UserCredentialsValidationError) -> String {
        var descriptionErrors: [String] = []

        if credentialsValidationError.contains(.invalidEmail) {
            descriptionErrors.append("login_user_invalid_email_error".localized)
        }

        if credentialsValidationError.contains(.invalidPassword) {
            descriptionErrors.append("login_user_invalid_password_error".localized)
        }

        let decriptionContent = descriptionErrors.joined(separator: Constants.terminatorCharacter)
        let message = String(format: "login_user_credentials_validation_error".localized, decriptionContent)

        return message
    }

    func map(userAuthenticationRequestError: UserAuthenticationRequestError) -> String {
        let message: String

        switch userAuthenticationRequestError {
        case .badCredentials:
            message = "login_user_authentication_bad_credentials_error".localized
        }

        return message
    }
    
}
