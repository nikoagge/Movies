//
//  ShowsAPI.swift
//  Movies
//
//  Created by Nikos Angelidis on 12/5/23.
//

import Foundation

protocol ShowsAPIProtocol {
    func getShows(completionHandler: @escaping(Result<[ServiceShow], HTTPError>) -> Void)
}

final class ShowsAPI: BaseNetworkManager<ShowsNetworking>, ShowsAPIProtocol {
    static let shared = ShowsAPI()
    
    func getShows(completionHandler: @escaping (Result<[ServiceShow], HTTPError>) -> Void) {
        self.fetchData(target: .getShows, response: [ServiceShow].self) { result in
            completionHandler(result)
        }
    }
}
