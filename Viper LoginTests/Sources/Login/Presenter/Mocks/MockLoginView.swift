//
//  MockLoginView.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

@testable import Viper_Login

final class MockLoginView: LoginViewProtocol {
    private(set) var viewInteractionEnabledSpy: (isCalled: Bool, value: Bool?) = (isCalled: false, value: nil)

    func setViewInteractionEnabled(to value: Bool) {
        viewInteractionEnabledSpy = (isCalled: true, value: value)
    }
}
