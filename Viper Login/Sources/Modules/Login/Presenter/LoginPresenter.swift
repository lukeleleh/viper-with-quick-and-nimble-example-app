//
//  LoginPresenter.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 03/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

final class LoginPresenter {
    
    private weak var view: LoginViewProtocol!
    private let interactor: LoginInteractorProtocol
    private let router: LoginRouterProtocol
    private let authenticateResultMapper: AuthenticationResultMapperProtocol

    init(withView view: LoginViewProtocol,
         interactor: LoginInteractorProtocol,
         router: LoginRouterProtocol,
         authenticateResultMapper: AuthenticationResultMapperProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.authenticateResultMapper = authenticateResultMapper
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    func didTapLoginButton(email: String?, password: String?) {
        authenticateUser(email: email, password: password)
    }
}

private extension LoginPresenter {
    func authenticateUser(email: String?, password: String?) {
        view.setViewInteractionEnabled(to: false)
        interactor.authenticateUser(email: email, password: password) { [weak self] result in
            self?.process(authenticationResult: result)
            self?.view.setViewInteractionEnabled(to: true)
        }
    }

    func process(authenticationResult: LoginInteractor.AuthenticationResult) {
        let alertMessage = authenticateResultMapper.map(from: authenticationResult)
        presenterAlert(message: alertMessage)
    }

    func presenterAlert(with title: String = "common_info_label".localized,
                        message: String,
                        actionTitle: String = "common_ok_button".localized) {
        router.presentAlerViewController(with: title, message: message, actionTitle: actionTitle)
    }
}
