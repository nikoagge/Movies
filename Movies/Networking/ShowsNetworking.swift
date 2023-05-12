//
//  ShowsNetworking.swift
//  Movies
//
//  Created by Nikos Angelidis on 12/5/23.
//

import Foundation

enum ShowsNetworking {
    case getShows
}

extension ShowsNetworking: TargetType {
    var baseURL: String {
        switch self {
        default:
            return Constants.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .getShows:
            return "/shows"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getShows:
            return .get
        }
    }
}
