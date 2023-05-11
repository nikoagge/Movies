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
        httpMethod: HTTPMethod,
        onSuccess: @escaping ((T) -> Void),
        onFailure: @escaping ((HTTPError) -> Void)
    ) {
        let url = URL(string: urlString)
        guard let url = url else {
            onFailure(.urlFailureError)
            
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    onFailure(.noDataError)
                    
                    return
                }
                let jsonDecoder = JSONDecoder()
                if let json = try? jsonDecoder.decode(T.self, from: data) {
                    onSuccess(json)
                } else {
                    onFailure(.parsingFailureError)
                }
            }
        }.resume()
    }
}
