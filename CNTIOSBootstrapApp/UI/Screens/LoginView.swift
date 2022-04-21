//
//  LoginView.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/13/22.
//

import SwiftUI
import JGProgressHUD_SwiftUI

struct LoginView: View {

    @Environment(\.injected) private var injected: DIContainer
    @EnvironmentObject var hudCoordinator: JGProgressHUDCoordinator

    var body: some View {
        VStack {
            Button(action: logIn) {
                Text("Log In")
                    .frame(maxWidth: .infinity, minHeight: 50.0)
                    .background(Color(R.color.blue))
                    .foregroundColor(.white)
            }
        }
        .padding(EdgeInsets.init(top: 0.0, leading: 24.0, bottom: 0.0, trailing: 24.0))
        .onReceive(injected.appState) {
            switch $0.userData.user {
            case .isLoading:
                hudCoordinator.showHUD { .init() }
            default:
                hudCoordinator.presentedHUD?.dismiss(animated: true)
            }
        }
    }
}

extension LoginView {

    private func logIn() {
        injected.interactors.authInteractor
            .logIn(username: "test", password: "test")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environment(\.injected, .preview)
    }
}
