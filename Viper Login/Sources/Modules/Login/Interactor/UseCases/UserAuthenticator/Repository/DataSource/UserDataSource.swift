//
//  UserDataSource.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 19/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

struct UserDataSource: UserDataSourceProtocol {
    func authenticate(email: String, password: String) -> AuthenticationResult {
        return fakeAuthenticate(email: email, password: password)
    }

}

private extension UserDataSource {
    enum Constants {
        static let validEmail = "luka.hristic.dev@gmail.com"
        static let validPassword = "1234"
        static let firstName = "Luka"
        static let lastName = "Hristic"
    }

    func fakeAuthenticate(email: String, password: String) -> AuthenticationResult {
        guard
            email == Constants.validEmail,
            password == Constants.validPassword
        else {
            return .failure(.badCredentials)
        }

        let user = UserResponse(firstName: Constants.firstName, lastName: Constants.lastName, email: email)
        return .success(user)
    }
}

