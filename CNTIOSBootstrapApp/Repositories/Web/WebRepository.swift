//
//  WebRepository.swift
//  CNTIOSBootstrapApp
//
//  Created by John Harold Rasco on 4/21/22.
//

import Foundation
import Combine

protocol WebRepository {
    var session: URLSession { get }
    var baseURL: String { get }
}

extension WebRepository {
    func request<Value>(endpoint: Endpoint) -> AnyPublisher<Value, Error> where Value: Decodable {
        do {
            let request = try endpoint.urlRequest()
            return session
                .dataTaskPublisher(for: request)
                .requestJSON()
        } catch let error {
            return Fail<Value, Error>(error: error).eraseToAnyPublisher()
        }
    }
}

private extension Publisher where Output == URLSession.DataTaskPublisher.Output {
    func requestJSON<Value>() -> AnyPublisher<Value, Error> where Value: Decodable {
        map { $0.0 }
        .decode(type: Value.self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
