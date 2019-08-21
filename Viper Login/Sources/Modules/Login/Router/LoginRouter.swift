//
//  LoginRouter.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 03/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import UIKit

final class LoginRouter {
    private weak var view: UIViewController!
    
    init(withView view: UIViewController) {
        self.view = view
    }

    static func assembleModule(withinNavController: Bool = false) -> UIViewController {
        let viewController: LoginViewController = LoginViewController.instantiateFromStoryboard()
        let router = LoginRouter(withView: viewController)

        let interactor: LoginInteractor = {
            let userCredentialsValidator = UserCredentialsValidator()
            let queueTimer: MainQueueTimer = {
                let dispatchQueue = DispatchQueue.main

                return MainQueueTimer(dispatchQueue: dispatchQueue)
            }()

            let userAuthenticator: UserAuthenticator = {
                let userDataSource = UserDataSource()
                let userRepositoryMapper = UserRepositoryMapper()
                let userRepository = UserRepository(userDataSource: userDataSource, mapper: userRepositoryMapper)
                let userAuthenticatorMapper = UserAuthenticatorMapper()

                return UserAuthenticator(userRepository: userRepository, mapper: userAuthenticatorMapper)
            }()

            return LoginInteractor(userCredentialsValidator: userCredentialsValidator,
                                   queueTimer: queueTimer,
                                   userAuthenticator: userAuthenticator)
        }()

        let authenticateResultMapper = AuthenticationResultMapper()
        let presenter = LoginPresenter(withView: viewController,
                                       interactor: interactor,
                                       router: router,
                                       authenticateResultMapper: authenticateResultMapper)

        viewController.presenter = presenter

        if withinNavController {
            let navigationController = UINavigationController(rootViewController: viewController)
            return navigationController
        }

        return viewController
    }
}

extension LoginRouter: LoginRouterProtocol {
    func presentAlerViewController(with title: String, message: String, actionTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: actionTitle, style: .default)
        alertController.addAction(okAlertAction)
        view.present(alertController, animated: true)
    }
}
