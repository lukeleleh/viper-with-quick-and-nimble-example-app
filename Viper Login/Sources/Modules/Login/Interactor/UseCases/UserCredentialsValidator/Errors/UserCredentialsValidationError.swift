//
//  UserCredentialsValidationError.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 03/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

struct UserCredentialsValidationError: OptionSet, Error {

    let rawValue: Int

    init(rawValue: Int) {
        self.rawValue = rawValue
    }

    static let invalidEmail            = UserCredentialsValidationError(rawValue: 1 << 0)

    static let invalidPassword         = UserCredentialsValidationError(rawValue: 1 << 1)
}
