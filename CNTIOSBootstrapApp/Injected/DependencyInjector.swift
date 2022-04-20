//
//  DependencyInjector.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/13/22.
//

import SwiftUI
import Combine

struct DIContainer: EnvironmentKey {
    init(appState: CurrentValueSubject<AppState, Never>, interactors: Interactors) {
        self.appState = appState
        self.interactors = interactors
    }

    init(appState: AppState, interactors: Interactors) {
        self.init(appState: CurrentValueSubject(appState), interactors: interactors)
    }

    let appState: CurrentValueSubject<AppState, Never>
    let interactors: Interactors

    static var defaultValue: Self { Self.default }

    private static let `default` = Self(appState: AppState(), interactors: .stub)
}

extension EnvironmentValues {
    var injected: DIContainer {
        get { self[DIContainer.self] }
        set { self[DIContainer.self] = newValue }
    }
}

#if DEBUG
extension DIContainer {
    static var preview: Self {
        .init(appState: .init(AppState()), interactors: .stub)
    }
}
#endif
