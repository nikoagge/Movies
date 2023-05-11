//
//  HTTPError.swift
//  Movies
//
//  Created by Nikos Angelidis on 11/5/23.
//

import Foundation

enum HTTPError: Error {
    case urlFailureError
    case noDataError
    case requestError
    case parsingFailureError
}
