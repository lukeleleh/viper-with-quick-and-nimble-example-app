//
//  UserRepositoryTests.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Quick
import Nimble

@testable import Viper_Login

final class UserRepositoryTests: QuickSpec {

    override func spec() {
        var userDataSource: MockUserDataSource!
        var mapper: MockUserRepositoryMapper!
        var sut: UserRepository!

        beforeEach {
            userDataSource = MockUserDataSource()
            mapper = MockUserRepositoryMapper()
            sut = UserRepository(userDataSource: userDataSource, mapper: mapper)
        }

        describe("authenticating") {
            context("with valid credentials") {
                beforeEach {
                    let user = UserResponse(firstName: "any", lastName: "any", email: "any")
                    userDataSource.stubResult = .success(user)
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

            context("with invalid credentials") {
                beforeEach {
                    userDataSource.stubResult = .failure(UserDataSourceError.badCredentials)
                }

                it("should not return a user") {
                    // Given
                    let email = "any"
                    let password = "any"

                    // When
                    let result = sut.authenticate(email: email, password: password).getError()

                    // Then
                    expect(result).to(matchError(UserRepositoryError.badCredentials))
                }
            }
        }

    }

}
