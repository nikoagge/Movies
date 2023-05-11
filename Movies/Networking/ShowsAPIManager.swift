//
//  ShowsAPIManager.swift
//  Movies
//
//  Created by Nikos Angelidis on 11/5/23.
//

import Foundation

final class ShowsAPIManager {
    static let shared = ShowsAPIManager()
    
    func fetchShows(onSuccess: @escaping(([ServiceShow]) -> Void), onFailure: @escaping (() -> Void)) {
        BaseNetworkManager.shared.callService("https://api.tvmaze.com/shows") { (movies: [ServiceShow]) in
            onSuccess(movies)
        } onFailure: {
            onFailure()
        }
    }
}
