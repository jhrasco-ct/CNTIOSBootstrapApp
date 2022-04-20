//
//  CNTIOSBootstrapApp.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/13/22.
//

import SwiftUI

@main
struct CNTIOSBootstrapApp: App {
    var body: some Scene {
        WindowGroup {
            let environment = AppEnvironment.bootstrap()
            ContentView(viewModel: .init(container: environment.container))
        }
    }
}