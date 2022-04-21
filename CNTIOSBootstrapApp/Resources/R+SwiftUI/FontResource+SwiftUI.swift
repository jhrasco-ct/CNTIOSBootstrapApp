//
//  FontResource+SwiftUI.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/21/22.
//

import SwiftUI
import Rswift

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Font {
    static func custom(_ fontResource: FontResource, size: CGFloat) -> Font {
        return .custom(fontResource.fontName, size: size)
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension FontResource {
    func swiftUI(size: CGFloat) -> Font {
        .custom(self, size: size)
    }
}
