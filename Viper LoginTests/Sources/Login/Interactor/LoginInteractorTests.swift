//
//  LoginInteractorTests.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Quick
import Nimble

@testable import Viper_Login

final class LoginInteractorTests: QuickSpec {

    override func spec() {
        var userCredentialsValidator: MockUserCredentialsValidator!
        var queueTimer: MockQueueTimer!
        var userAuthenticator: MockUserAuthenticator!
        var sut: LoginInteractor!

        beforeEach {
            userCredentialsValidator = MockUserCredentialsValidator()
            queueTimer = MockQueueTimer()
            userAuthenticator = MockUserAuthenticator()
            sut = LoginInteractor(userCredentialsValidator: userCredentialsValidator,
                                  queueTimer: queueTimer,
                                  userAuthenticator: userAuthenticator)
        }

        describe("authenticating") {
            context("when credentials format is valid") {
                beforeEach {
                    let userCredentials = UserCredentialsValidatorProtocol.UserCredentials(email: "any", password: "any")
                    userCredentialsValidator.stubResult = .success(userCredentials)
                }

                context("when credentials are correct") {
                    beforeEach {
                        let user = User(fullName: "any", email: "any")
                        userAuthenticator.stubResult = .success(user)
                    }

                    it("should return a user") {
                        // Given
                        let email = "any"
                        let password = "any"
                        var result: User?
                        let completionBlock: LoginInteractor.AuthenticationCompletionBlock = { authenticateResult in
                            result = try? authenticateResult.get()
                        }

                        // When
                        sut.authenticateUser(email: email, password: password, completionBlock: completionBlock)

                        // Then
                        expect(result).toNot(beNil())
                    }
                }

                context("when credentials are incorrect") {
                    beforeEach {
                        userAuthenticator.stubResult = .failure(.badCredentials)
                    }

                    it("should return a bad credentials error") {
                        // Given
                        let email = "any"
                        let password = "any"
                        var result: Error?
                        let completionBlock: LoginInteractor.AuthenticationCompletionBlock = { authenticateResult in
                            result = authenticateResult.getError()
                        }

                        // When
                        sut.authenticateUser(email: email, password: password, completionBlock: completionBlock)

                        // Then
                        expect(result).to(matchError(UserAuthenticationError.authentication(.badCredentials)))
                    }
                }
            }

            context("when credentials format is not valid") {
                beforeEach {
                    userCredentialsValidator.stubResult = .failure(.invalidEmail)
                }

                it("should return a validation error") {
                    // Given
                    let email = "any"
                    let password = "any"
                    var result: Error?
                    let completionBlock: LoginInteractor.AuthenticationCompletionBlock = { authenticateResult in
                        result = authenticateResult.getError()
                    }

                    // When
                    sut.authenticateUser(email: email, password: password, completionBlock: completionBlock)

                    // Then
                    expect(result).to(matchError(UserAuthenticationError.validation(.invalidEmail)))
                }

                it("should not try to authenticate") {
                    // Given
                    let email = "any"
                    let password = "any"
                    let completionBlock: LoginInteractor.AuthenticationCompletionBlock = { _ in }

                    // When
                    sut.authenticateUser(email: email, password: password, completionBlock: completionBlock)
                    let result = userAuthenticator.isAuthenticateCalled

                    // Then
                    expect(result).to(beFalse())
                }
            }
        }

    }

}
