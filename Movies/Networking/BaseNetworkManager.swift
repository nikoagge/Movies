//
//  BaseNetworkManager.swift
//  Movies
//
//  Created by Nikos Angelidis on 11/5/23.
//

import Foundation

final class BaseNetworkManager {
    static let shared = BaseNetworkManager()
    
    func callService<T: Decodable>(
        _ urlString: String,
        onSuccess: @escaping ((T) -> Void),
        onFailure: @escaping (() -> Void)
    ) {
        let url = URL(string: urlString)
        guard let url = url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            if let json = try? jsonDecoder.decode(T.self, from: data) {
                onSuccess(json)
            } else {
                onFailure()
            }
        }.resume()
    }
}
