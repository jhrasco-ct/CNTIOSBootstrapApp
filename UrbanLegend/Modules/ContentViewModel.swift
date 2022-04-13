//
//  ContentViewModel.swift
//  UrbanLegend
//
//  Created by John Harold Rasco on 4/13/22.
//

import Combine

class ContentViewModel: ObservableObject {

    init(container: DIContainer) {
        self.container = container
    }

    let container: DIContainer

    var isLoggedIn: Bool {
        container.appState.value.userData.isLoggedIn
    }

}
