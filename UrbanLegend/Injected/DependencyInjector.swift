//
//  DependencyInjector.swift
//  UrbanLegend
//
//  Created by John Harold Rasco on 4/13/22.
//

import SwiftUI
import Combine

struct DIContainer: EnvironmentKey {

    let appState: CurrentValueSubject<AppState, Never>

    static var defaultValue: Self { Self.default }

    private static let `default` = DIContainer(appState: AppState())

    init(appState: CurrentValueSubject<AppState, Never>) {
        self.appState = appState
    }

    init(appState: AppState) {
        self.init(appState: .init(appState))
    }
}
