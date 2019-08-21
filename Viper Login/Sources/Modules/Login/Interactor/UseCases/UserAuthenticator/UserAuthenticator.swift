//
//  UserAuthenticator.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 03/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

final class UserAuthenticator: UserAuthenticatorProtocol {

    private let userRepository: UserRepositoryProtocol
    private let mapper: UserAuthenticatorMapperProtocol

    init(userRepository: UserRepositoryProtocol,
         mapper: UserAuthenticatorMapperProtocol) {
        self.userRepository = userRepository
        self.mapper = mapper
    }

    func authenticate(email: String, password: String) -> AuthenticationResult {
        let authenticationResult = userRepository.authenticate(email: email, password: password)
            .mapError(mapper.map(userRepositoryError:))

        return authenticationResult
    }

}
