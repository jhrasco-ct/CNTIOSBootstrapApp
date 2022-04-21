//
//  ContentView.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/13/22.
//

import SwiftUI
import JGProgressHUD_SwiftUI

struct ContentView: View {
    init(container: DIContainer) {
        self.container = container
        self._isAuthenticated = State(initialValue: container.appState.value.userData.isLoggedIn)
    }

    private let container: DIContainer

    @State private var isAuthenticated: Bool

    var body: some View {
        JGProgressHUDPresenter {
            if isAuthenticated {
                HomeView()
                    .environment(\.injected, container)
                    .transition(.opacity.animation(.easeInOut(duration: 0.3)))
            } else {
                LoginView()
                    .environment(\.injected, container)
                    .transition(.opacity.animation(.easeInOut(duration: 0.3)))
            }
        }
        .onReceive(container.appState) {
            isAuthenticated = $0.userData.isLoggedIn
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
