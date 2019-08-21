//
//  UserRepositoryMapperTests.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Quick
import Nimble

@testable import Viper_Login

final class UserRepositoryMapperTests: QuickSpec {

    override func spec() {
        var sut: UserRepositoryMapper!

        beforeEach {
            sut = UserRepositoryMapper()
        }

        describe("mapping a UserResponse type") {
            it("should return a formatted User type") {
                // Given
                let userResponse = UserResponse(firstName: "Luka", lastName: "Hristic", email: "<email>")
                let expectedResult = User(fullName: "Luka Hristic", email: "<email>")

                // When
                let result = sut.map(userResponse: userResponse)

                // Then
                expect(result).to(equal(expectedResult))
            }
        }

        describe("mapping a UserDataSourceError type") {
            it("should return the corresponding UserRepositoryError type") {
                // Given
                let userDataSourceError = UserDataSourceError.badCredentials
                let expectedResult = UserRepositoryError.badCredentials

                // When
                let result = sut.map(userDataSourceError: userDataSourceError)

                // Then
                expect(result).to(equal(expectedResult))
            }
        }

    }

}
