//
//  UserDataSourceTests.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Quick
import Nimble

@testable import Viper_Login

final class UserDataSourceTests: QuickSpec {

    override func spec() {
        var sut: UserDataSource!

        beforeEach {
            sut = UserDataSource()
        }

        describe("authenticating") {
            context("with valid credentials") {
                it("should return a user") {
                    // Given
                    let email = "luka.hristic.dev@gmail.com"
                    let password = "1234"
                    let expectedResult = UserResponse(firstName: "Luka", lastName: "Hristic", email: email)

                    // When
                    let result = try? sut.authenticate(email: email, password: password).get()

                    // Then
                    expect(result).to(equal(expectedResult))
                }
            }

            context("with invalid credentials") {
                it("should return an error") {
                    // Given
                    let email = "invalid email"
                    let password = "invalid password"
                    let expectedResult = UserDataSourceError.badCredentials

                    // When
                    let result = sut.authenticate(email: email, password: password).getError()

                    // Then
                    expect(result).to(matchError(expectedResult))
                }
            }
        }

    }

}
