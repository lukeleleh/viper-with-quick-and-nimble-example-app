//
//  UserRepository.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 19/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

struct UserRepository: UserRepositoryProtocol {

    private let userDataSource: UserDataSourceProtocol
    private let mapper: UserRepositoryMapperProtocol

    init(userDataSource: UserDataSourceProtocol,
         mapper: UserRepositoryMapperProtocol) {
        self.userDataSource = userDataSource
        self.mapper = mapper
    }

    func authenticate(email: String, password: String) -> AuthenticationResult {
        let authenticationResult = userDataSource.authenticate(email: email, password: password)
            .map(mapper.map(userResponse:))
            .mapError(mapper.map(userDataSourceError:))

        return authenticationResult
    }
}
