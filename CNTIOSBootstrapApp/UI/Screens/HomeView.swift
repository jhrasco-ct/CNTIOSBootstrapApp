//
//  HomeView.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/20/22.
//

import SwiftUI

struct HomeView: View {

    @Environment(\.injected) private var injected: DIContainer

    var body: some View {
        ZStack {
            Color(R.color.sand)
                .ignoresSafeArea()

            Text("Home")
                .fontWeight(.bold)
        }
    }
}

struct MyCampaignsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.injected, .preview)
    }
}
