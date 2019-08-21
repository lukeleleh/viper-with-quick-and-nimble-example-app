//
//  LoginPresenterTests.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Quick
import Nimble

@testable import Viper_Login

final class LoginPresenterTests: QuickSpec {

    var sut: LoginPresenter!

    override func spec() {
        var loginView: MockLoginView!
        var interactor: MockLoginInteractor!
        var router: MockLoginRouter!
        var authenticateResultMapper: MockAuthenticationResultMapper!

        beforeEach {
            loginView = MockLoginView()
            interactor = MockLoginInteractor()
            router = MockLoginRouter()
            authenticateResultMapper = MockAuthenticationResultMapper()
            self.sut = LoginPresenter(withView: loginView,
                                 interactor: interactor,
                                 router: router,
                                 authenticateResultMapper: authenticateResultMapper)
        }

        describe("when the login button is tap") {
            it("should disable the view interaction") {
                self.didTapLoginButton()

                // Then
                expect(loginView.viewInteractionEnabledSpy.isCalled).to(beTrue())
                expect(loginView.viewInteractionEnabledSpy.value).to(beFalse())
            }

            it("should start the authenticate process") {
                self.didTapLoginButton()

                // Then
                expect(interactor.isAuthenticateUserCalled).to(beTrue())
            }

            context("when the authenticate process returns a user") {
                beforeEach {
                    let user = User(fullName: "any", email: "any")
                    interactor.stubResult = .success(user)
                }

                it("should present a welcome alert") {
                    self.didTapLoginButton()

                    // Then
                    expect(router.isPresentAlerViewControllerCalled).to(beTrue())
                }

                it("should enable the view interaction") {
                    self.didTapLoginButton()

                    // Then
                    expect(loginView.viewInteractionEnabledSpy.isCalled).to(beTrue())
                    expect(loginView.viewInteractionEnabledSpy.value).to(beTrue())
                }
            }

            context("when the authenticate process returns an error") {
                beforeEach {
                    interactor.stubResult = .failure(.authentication(.badCredentials))
                }

                it("should present an error alert") {
                    self.didTapLoginButton()

                    // Then
                    expect(router.isPresentAlerViewControllerCalled).to(beTrue())
                }

                it("should enable the view interaction") {
                    self.didTapLoginButton()

                    // Then
                    expect(loginView.viewInteractionEnabledSpy.isCalled).to(beTrue())
                    expect(loginView.viewInteractionEnabledSpy.value).to(beTrue())
                }
            }
        }

    }

}

private extension LoginPresenterTests {

    func didTapLoginButton() {
        // Given
        let email = "any"
        let password = "any"

        // When
        sut.didTapLoginButton(email: email, password: password)
    }

}
