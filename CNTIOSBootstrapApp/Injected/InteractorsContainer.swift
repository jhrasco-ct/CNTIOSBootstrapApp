//
//  InteractorsContainer.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/20/22.
//

import Foundation

extension DIContainer {
    struct Interactors {
        init(authInteractor: AuthInteractor) {
            self.authInteractor = authInteractor
        }

        let authInteractor: AuthInteractor

        static var stub: Self {
            .init(authInteractor: StubAuthInteractor())
        }
    }
}
