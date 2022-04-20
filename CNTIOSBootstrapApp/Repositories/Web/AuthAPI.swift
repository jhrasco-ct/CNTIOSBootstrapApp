//
//  AuthAPI.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/20/22.
//

import Foundation

enum AuthAPI {
    case logIn(username: String, password: String)
}

extension AuthAPI: APITargetType {
    var baseURL: URL {
        URL(string: "https://sample_base_url.com")!
    }

    var path: String {
        switch self {
        case .logIn:
            return "sample_path"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .logIn:
            return .post
        }
    }

    var headers: [String : String]? {
        nil
    }
}
