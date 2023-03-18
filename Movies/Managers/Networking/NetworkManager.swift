//
//  NetworkManager.swift
//  Movies
//
//  Created by Nikos Aggelidis on 18/3/23.
//

import Foundation
import Moya

protocol NetworkManagerType {
    func getShows(onCompletion: @escaping (Result<[Show], Error>) -> Void)
}

final class NetworkManager: NetworkManagerType {
    var moviesProvider: MoyaProvider<MoviesAPI>
    
    init() {
        self.moviesProvider = MoyaProvider<MoviesAPI>(endpointClosure: { (target: TargetType) -> Endpoint in
            return MoyaProvider.defaultEndpointMapping(for: MultiTarget(target))
        })
    }
    
    func getShows(onCompletion: @escaping (Result<[Show], Error>) -> Void) {
        moviesProvider.request(.getShows) { result in
            switch result {
            case .success(let response):
                do {
                    let shows = try JSONDecoder().decode([Show].self, from: response.data)
                    onCompletion(.success(shows))
                    
                    return
                } catch (let error) {
                    debugPrint("Error: \(error.localizedDescription)")
                    onCompletion(.failure(error))
                    
                    return
                }
                
            case .failure(let error):
                debugPrint("Moya error: \(error.localizedDescription)")
                onCompletion(.failure(error))
                
                return
            }
        }
    }
}
