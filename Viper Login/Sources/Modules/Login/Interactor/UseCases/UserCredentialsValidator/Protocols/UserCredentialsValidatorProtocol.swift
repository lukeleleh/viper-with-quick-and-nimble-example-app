//
//  UserCredentialsValidatorProtocol.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 03/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

protocol UserCredentialsValidatorProtocol {
    typealias UserCredentials = (email: String, password: String)
    typealias ValidationResult = Result<UserCredentials, UserCredentialsValidationError>

    func validate(email: String?, password: String?) -> ValidationResult
}
