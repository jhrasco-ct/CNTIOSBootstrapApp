//
//  ContentView.swift
//  UrbanLegend
//
//  Created by John Harold Rasco on 4/13/22.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        Group {
            if viewModel.isLoggedIn {
                LoginView(viewModel: .init(container: viewModel.container))
            } else {
                LoginView(viewModel: .init(container: viewModel.container))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init(container: .init(appState: .init())))
    }
}
