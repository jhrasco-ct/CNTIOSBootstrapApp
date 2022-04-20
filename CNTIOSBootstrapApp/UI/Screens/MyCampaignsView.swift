//
//  MyCampaignsView.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/20/22.
//

import SwiftUI

struct MyCampaignsView: View {

    @Environment(\.injected) private var injected: DIContainer

    var body: some View {
        Text("My Campaigns Screen")
    }
}

struct MyCampaignsView_Previews: PreviewProvider {
    static var previews: some View {
        MyCampaignsView()
            .environment(\.injected, .preview)
    }
}
