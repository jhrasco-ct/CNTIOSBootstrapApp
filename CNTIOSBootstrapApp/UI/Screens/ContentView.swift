//
//  ContentView.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/13/22.
//

import SwiftUI

struct ContentView: View {
    init(container: DIContainer) {
        self.container = container
    }

    private let container: DIContainer

    var body: some View {
        Group {
            if container.appState.value.userData.isLoggedIn {
                MyCampaignsView()
            } else {
                LoginView()
            }
        }
    }
}

// MARK: - Preview

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(container: .preview)
    }
}
#endif
