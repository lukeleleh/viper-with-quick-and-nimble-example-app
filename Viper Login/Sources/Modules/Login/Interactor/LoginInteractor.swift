//
//  LoginInteractor.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 03/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

final class LoginInteractor {

    private let userCredentialsValidator: UserCredentialsValidatorProtocol
    private let queueTimer: QueueTimer
    private let userAuthenticator: UserAuthenticatorProtocol

    init(userCredentialsValidator: UserCredentialsValidatorProtocol,
         queueTimer: QueueTimer,
         userAuthenticator: UserAuthenticatorProtocol) {
        self.userCredentialsValidator = userCredentialsValidator
        self.queueTimer = queueTimer
        self.userAuthenticator = userAuthenticator
    }
}

extension LoginInteractor: LoginInteractorProtocol {
    func authenticateUser(email: String?,
                          password: String?,
                          completionBlock: @escaping AuthenticationCompletionBlock) {
        let validationResult = userCredentialsValidator.validate(email: email, password: password)
        switch validationResult {
        case let .success(credentials):
            authenticateUser(with: credentials.email, password: credentials.password, completionBlock: completionBlock)
        case let .failure(error):
            completionBlock(.failure(.validation(error)))
        }
    }
}

private extension LoginInteractor {

    enum Constants {
        static let queueTimerDefaultTimeInterval: QueueTimer.TimeInterval = 1
    }

    func authenticateUser(with email: String,
                          password: String,
                          completionBlock: @escaping AuthenticationCompletionBlock) {
        queueTimer.schedule(timeInterval: Constants.queueTimerDefaultTimeInterval) { [weak self] in
            guard let self = self else {
                return
            }

            let authenticationResult = self.userAuthenticator.authenticate(email: email, password: password)
            switch authenticationResult {
            case let .success(user):
                completionBlock(.success(user))
            case let .failure(error):
                completionBlock(.failure(.authentication(error)))
            }
        }
    }
}
