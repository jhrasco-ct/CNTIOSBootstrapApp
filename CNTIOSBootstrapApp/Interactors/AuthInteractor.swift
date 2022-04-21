//
//  AuthInteractor.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/20/22.
//

import Combine
import SwiftUI

protocol AuthInteractor {
    func logIn(username: String, password: String)
}

struct RealAuthInteractor: AuthInteractor {

    init(authWebRepository: AuthWebRepository,
         userDefaults: UserDefaults,
         appState: CurrentValueSubject<AppState, Never>) {
        self.authWebRepository = authWebRepository
        self.userDefaults = userDefaults
        self.appState = appState

        self.appState.value.userData.isLoggedIn = isAuthenticated
    }

    var isAuthenticated: Bool {
        userDefaults.bool(forKey: Constant.isAuthenticatedKey)
    }

    func logIn(username: String, password: String) {
        let cancelBag = CancelBag()
        appState.value.userData.user.setIsLoading(cancelBag: cancelBag)
        authWebRepository.logIn(username: username, password: password)
            .sinkToLoadable {
                userDefaults.set(true, forKey: Constant.isAuthenticatedKey)
                appState.value.userData.user = $0
                appState.value.userData.isLoggedIn = true
            }
            .store(in: cancelBag)
    }

    // MARK: - Private

    private enum Constant {
        static let isAuthenticatedKey = "is_authenticated"
    }

    private let authWebRepository: AuthWebRepository
    private let userDefaults : UserDefaults
    private let appState: CurrentValueSubject<AppState, Never>
}

struct StubAuthInteractor: AuthInteractor {

    func logIn(username: String, password: String) { }
}
