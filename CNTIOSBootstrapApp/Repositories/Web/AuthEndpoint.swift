//
//  AuthEndpoint.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/20/22.
//

import Foundation

enum AuthEndpoint {
    case logIn(username: String, password: String)
}

extension AuthEndpoint: Endpoint {
    var baseURL: String {
        "https://sample_base_url.com"
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

    func body() throws -> Data? {
        nil
    }
}
