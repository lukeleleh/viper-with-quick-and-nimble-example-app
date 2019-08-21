//
//  AuthenticationResultMapperTests.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Quick
import Nimble

@testable import Viper_Login

final class AuthenticationResultMapperTests: QuickSpec {

    override func spec() {
        var sut: AuthenticationResultMapper!

        beforeEach {
            sut = AuthenticationResultMapper()
        }

        describe("mapping a successful result") {
            it("should return the corresponding formatted message") {
                // Given
                let user = User(fullName: "<full name>", email: "<email>")
                let authenticationResult: LoginInteractor.AuthenticationResult = .success(user)
                let expectedResult = String(format: "login_authentication_success_message".localized, "<full name>")

                // When
                let result = sut.map(from: authenticationResult)

                // Then
                expect(result).to(equal(expectedResult))
            }
        }

        describe("mapping a failure result") {
            context("where the error is from validation") {
                it("should return the formatted message containing the errors header") {
                    // Given
                    let authenticationResult: LoginInteractor.AuthenticationResult = .failure(.validation(.init()))
                    let containingExpectedResult = String(format: "login_user_credentials_validation_error".localized, "")

                    // When
                    let result = sut.map(from: authenticationResult)

                    // Then
                    expect(result).to(contain(containingExpectedResult))
                }

                context("being an invalid email") {
                    it("should return the formatted message containing the errors header") {
                        // Given
                        let authenticationResult: LoginInteractor.AuthenticationResult = .failure(.validation(.invalidEmail))
                        let containingExpectedResult = "login_user_invalid_email_error".localized

                        // When
                        let result = sut.map(from: authenticationResult)

                        // Then
                        expect(result).to(contain(containingExpectedResult))
                    }
                }

                context("being an invalid password") {
                    it("should return the formatted message containing the errors header") {
                        // Given
                        let authenticationResult: LoginInteractor.AuthenticationResult = .failure(.validation(.invalidPassword))
                        let containingExpectedResult = "login_user_invalid_password_error".localized

                        // When
                        let result = sut.map(from: authenticationResult)

                        // Then
                        expect(result).to(contain(containingExpectedResult))
                    }
                }
            }

            context("where the error is from authentication") {
                it("should return the corresponding formatted message") {
                    // Given
                    let authenticationResult: LoginInteractor.AuthenticationResult = .failure(.authentication(.badCredentials))
                    let expectedResult = "login_user_authentication_bad_credentials_error".localized

                    // When
                    let result = sut.map(from: authenticationResult)

                    // Then
                    expect(result).to(equal(expectedResult))
                }
            }
        }

    }

}
