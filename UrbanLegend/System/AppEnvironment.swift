//
//  AppEnvironment.swift
//  UrbanLegend
//
//  Created by John Harold Rasco on 4/13/22.
//

import Combine

struct AppEnvironment {
    let container: DIContainer
}

extension AppEnvironment {
    static func bootstrap() -> AppEnvironment {
        let appState = CurrentValueSubject<AppState, Never>(AppState())
        let container = DIContainer(appState: appState)
        return .init(container: container)
    }
}
