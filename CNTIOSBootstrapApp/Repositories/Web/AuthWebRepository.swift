//
//  AuthWebRepository.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/20/22.
//

import Foundation
import Combine

protocol AuthWebRepository {
    func logIn(username: String, password: String) -> AnyPublisher<User, Never>
}

struct RealAuthWebRepository: AuthWebRepository {
    init(session: URLSession) {
        self.session = session
    }

    private let session: URLSession

    func logIn(username: String, password: String) -> AnyPublisher<User, Never> {
        Just(User(id: "0"))
            .eraseToAnyPublisher()
    }
}
