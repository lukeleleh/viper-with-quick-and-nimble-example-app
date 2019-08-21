//
//  LoginRouterTests.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Quick
import Nimble

@testable import Viper_Login

final class LoginRouterTests: QuickSpec {

    override func spec() {
        var viewController: MockUIViewController!
        var sut: LoginRouter!

        beforeEach {
            viewController = MockUIViewController()
            sut = LoginRouter(withView: viewController)
        }

        describe("presenting the alert view controller") {
            it("should have the correct properties set") {
                // Given
                let title = "title"
                let message = "message"
                let actionTitle = "actionTitle"

                // When
                sut.presentAlerViewController(with: title, message: message, actionTitle: actionTitle)
                let resultAlertContent = viewController.alertContent

                // Then
                expect(resultAlertContent?.title).to(equal(title))
                expect(resultAlertContent?.message).to(equal(message))
                expect(resultAlertContent?.actionTitle).to(equal(actionTitle))
            }
        }

    }

}
