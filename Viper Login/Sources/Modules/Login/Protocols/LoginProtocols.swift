//
//  LoginProtocols.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 03/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

protocol LoginInteractorProtocol: class {
    typealias AuthenticationResult = Result<User, UserAuthenticationError>
    typealias AuthenticationCompletionBlock = (AuthenticationResult) -> Void

    func authenticateUser(email: String?, password: String?, completionBlock: @escaping AuthenticationCompletionBlock)
}

protocol LoginRouterProtocol: class {
    func presentAlerViewController(with title: String, message: String, actionTitle: String)
}

protocol LoginPresenterProtocol: class {
    func didTapLoginButton(email: String?, password: String?)
}

protocol LoginViewProtocol: class {
    func setViewInteractionEnabled(to value: Bool)
}
