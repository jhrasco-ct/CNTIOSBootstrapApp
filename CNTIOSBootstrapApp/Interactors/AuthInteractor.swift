//
//  AuthInteractor.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/20/22.
//

import Combine
import SwiftUI

protocol AuthInteractor {

}

struct RealAuthInteractor: AuthInteractor {

    init(authWebRepository: AuthWebRepository,
         appState: CurrentValueSubject<AppState, Never>) {
        self.authWebRepository = authWebRepository
        self.appState = appState
    }

    private let authWebRepository: AuthWebRepository
    private let appState: CurrentValueSubject<AppState, Never>

    func logIn(user: LoadableBinding<User>, username: String, password: String) {
        let cancelBag = CancelBag()
        user.wrappedValue.setIsLoading(cancelBag: cancelBag)
        authWebRepository.logIn(username: username, password: password)
            .sinkToLoadable(user)
            .store(in: cancelBag)
    }
}

struct StubAuthInteractor: AuthInteractor {

    func logIn(user: LoadableBinding<User>, username: String, password: String) { }
}
