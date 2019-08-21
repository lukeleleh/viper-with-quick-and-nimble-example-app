//
//  MockAuthenticationResultMapper.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

@testable import Viper_Login

final class MockAuthenticationResultMapper: AuthenticationResultMapperProtocol {
    var stubMessage: String = ""

    func map(from result: LoginInteractor.AuthenticationResult) -> String {
        return stubMessage
    }
}
