//
//  LoginView.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/13/22.
//

import SwiftUI

struct LoginView: View {

    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        Text("Login Screen")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: .init(container: .init(appState: .init())))
    }
}
