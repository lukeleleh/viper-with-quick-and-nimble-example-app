//
//  MockLoginRouter.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

@testable import Viper_Login

final class MockLoginRouter: LoginRouterProtocol {
    private(set) var isPresentAlerViewControllerCalled = false

    private(set) var givenMessage: String?

    func presentAlerViewController(with title: String, message: String, actionTitle: String) {
        isPresentAlerViewControllerCalled = true
        givenMessage = message
    }
}
