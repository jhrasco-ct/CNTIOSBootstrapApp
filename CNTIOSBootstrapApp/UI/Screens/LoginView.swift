//
//  LoginView.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/13/22.
//

import SwiftUI

struct LoginView: View {

    @Environment(\.injected) private var injected: DIContainer

    var body: some View {
        Text("Log In")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environment(\.injected, .preview)
    }
}
