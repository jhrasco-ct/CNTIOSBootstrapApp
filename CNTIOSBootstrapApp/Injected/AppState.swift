//
//  AppState.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/13/22.
//

import Foundation

struct AppState: Equatable {
    var userData = UserData()
}

extension AppState {
    struct UserData: Equatable {
        var isLoggedIn = false
        var user = Loadable<User>.notRequested
    }
}
