//
//  UserAuthenticatorTests.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 19/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Quick
import Nimble

@testable import Viper_Login

final class UserAuthenticatorTests: QuickSpec {

    override func spec() {
        var userRepository: MockUserRepository!
        var mapper: MockUserAuthenticatorMapper!
        var sut: UserAuthenticator!

        beforeEach {
            userRepository = MockUserRepository()
            mapper = MockUserAuthenticatorMapper()
            sut = UserAuthenticator(userRepository: userRepository, mapper: mapper)
        }

        describe("authenticating") {
            context("when credentials are valid") {
                beforeEach {
                    let user = User(fullName: "any", email: "any")
                    userRepository.stubResult = .success(user)
                }

                it("should return a user") {
                    // Given
                    let email = "any"
                    let password = "any"

                    // When
                    let result = try? sut.authenticate(email: email, password: password).get()

                    // Then
                    expect(result).toNot(beNil())
                }
            }

            context("when credentials are not valid") {
                beforeEach {
                    userRepository.stubResult = .failure(.badCredentials)
                }

                it("should return an error") {
                    // Given
                    let email = "any"
                    let password = "any"

                    // When
                    let result = sut.authenticate(email: email, password: password).getError()

                    // Then
                    expect(result).to(matchError(UserAuthenticationRequestError.badCredentials))
                }
            }
        }

    }

}
