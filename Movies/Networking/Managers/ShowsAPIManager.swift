//
//  ShowsAPIManager.swift
//  Movies
//
//  Created by Nikos Angelidis on 11/5/23.
//

import Foundation

final class ShowsAPIManager {
    static let shared = ShowsAPIManager()
    
    func fetchShows(onSuccess: @escaping(([ServiceShow]) -> Void), onFailure: @escaping ((HTTPError) -> Void)) {
        BaseNetworkManager.shared.callService(
            Constants.SHOWS_URL,
            httpMethod: .get
        ) { (response: [ServiceShow]) in
            onSuccess(response)
        } onFailure: { error in
            onFailure(error)
        }
    }
}
