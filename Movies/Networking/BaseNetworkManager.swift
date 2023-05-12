//
//  BaseNetworkManager.swift
//  Movies
//
//  Created by Nikos Angelidis on 11/5/23.
//

import Foundation
import Alamofire

protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
}

class BaseNetworkManager<T: TargetType> {
    func fetchData<U: Decodable>(
        target: T,
        response: U.Type,
        completionHandler: @escaping(Result<U, HTTPError>) -> Void
    ) {
        let method = Alamofire.HTTPMethod(rawValue: target.httpMethod.rawValue)
        
        
        AF.request(target.baseURL + target.path, method: method).responseJSON { response in
            guard let statusCode = response.response?.statusCode else {
                completionHandler(.failure(.noStatusCodeError))
                
                return
            }
            
            if statusCode == 200 {
                guard let jsonResponse = try? response.result.get() else {
                    completionHandler(.failure(.jsonResponseError))
                    
                    return
                }
                
                guard let decodedJSON = try? JSONDecoder().decode(U.self, from: response.data ?? Data()) else {
                    completionHandler(.failure(.parsingFailureError))
                    
                    return
                }
                
                completionHandler(.success(decodedJSON))
            } else {
                completionHandler(.failure(.noSuccessfulStatusCode))
            }
        }
    }
}
