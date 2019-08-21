//
//  UserAuthenticatorMapperTests.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Quick
import Nimble

@testable import Viper_Login

final class UserAuthenticatorMapperTests: QuickSpec {

    override func spec() {
        var sut: UserAuthenticatorMapper!

        beforeEach {
            sut = UserAuthenticatorMapper()
        }

        describe("mapping a UserRepositoryError type") {
            it("should return the corresponding UserAuthenticationRequestError type") {
                // Given
                let userRepositoryError = UserRepositoryError.badCredentials
                let expectedResult = UserAuthenticationRequestError.badCredentials

                // When
                let result = sut.map(userRepositoryError: userRepositoryError)
                

                // Then
                expect(result).to(equal(expectedResult))
            }
        }

    }

}
