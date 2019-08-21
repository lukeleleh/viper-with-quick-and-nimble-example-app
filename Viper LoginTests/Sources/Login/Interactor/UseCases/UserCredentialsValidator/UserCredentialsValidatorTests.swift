//
//  UserCredentialsValidatorTests.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Quick
import Nimble

@testable import Viper_Login

final class UserCredentialsValidatorTests: QuickSpec {

    override func spec() {
        var sut: UserCredentialsValidator!

        beforeEach {
            sut = UserCredentialsValidator()
        }

        describe("validating") {
            context("credentials that have the correct format") {
                it("should return a succesfull response") {
                    // Given
                    let email = "any"
                    let password = "any"

                    // When
                    let result = try? sut.validate(email: email, password: password).get()

                    // Then
                    expect(result?.email).to(equal(email))
                    expect(result?.password).to(equal(password))
                }
            }

            context("credentials that are nil") {
                it("should return an error") {
                    // Given
                    let email: String? = nil
                    let password: String? = nil
                    let expectedResult: UserCredentialsValidationError = [.invalidEmail, .invalidPassword]

                    // When
                    let result = sut.validate(email: email, password: password).getError()

                    // Then
                    expect(result).to(equal(expectedResult))
                }
            }

            context("credentials where the email is incorrect") {
                it("should return an error") {
                    // Given
                    let email = ""
                    let password = "any"

                    // When
                    let result = sut.validate(email: email, password: password).getError()

                    // Then
                    expect(result).to(matchError(UserCredentialsValidationError.invalidEmail))
                }
            }

            context("credentials where the password is incorrect") {
                it("should return an error") {
                    // Given
                    let email = "any"
                    let password = ""

                    // When
                    let result = sut.validate(email: email, password: password).getError()

                    // Then
                    expect(result).to(matchError(UserCredentialsValidationError.invalidPassword))
                }
            }

            context("credentials where the email and password are incorrect") {
                it("should return an error") {
                    // Given
                    let email = ""
                    let password = ""
                    let expectedResult: UserCredentialsValidationError = [.invalidEmail, .invalidPassword]

                    // When
                    let result = sut.validate(email: email, password: password).getError()

                    // Then
                    expect(result).to(equal(expectedResult))
                }
            }
        }

    }

}
