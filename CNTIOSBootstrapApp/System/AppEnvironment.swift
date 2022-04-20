//
//  AppEnvironment.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/13/22.
//

import Foundation
import Combine

struct AppEnvironment {
    let container: DIContainer
}

extension AppEnvironment {
    static func bootstrap() -> AppEnvironment {
        let appState = CurrentValueSubject<AppState, Never>(AppState())
        let session = configuredURLSession()
        let webRepositories = configuredWebRepositories(session: session)
        let interactors = configuredInteractors(appState: appState, webRepositories: webRepositories)
        let container = DIContainer(appState: appState, interactors: interactors)
        return .init(container: container)
    }

    private static func configuredURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 120
        configuration.waitsForConnectivity = true
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        configuration.urlCache = .shared
        return URLSession(configuration: configuration)
    }

    private static func configuredWebRepositories(session: URLSession) -> DIContainer.WebRepositories {
        let authWebRepository = RealAuthWebRepository(session: session)
        return .init(authWebRepository: authWebRepository)
    }

    private static func configuredInteractors(appState: CurrentValueSubject<AppState, Never>,
                                              webRepositories: DIContainer.WebRepositories) -> DIContainer.Interactors {
        let authInteractor = RealAuthInteractor(
            authWebRepository: webRepositories.authWebRepository,
            appState: appState)

        return .init(authInteractor: authInteractor)
    }
}

extension DIContainer {
    struct WebRepositories {
        let authWebRepository: AuthWebRepository
    }
}
