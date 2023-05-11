//
//  HTTPMethod.swift
//  Movies
//
//  Created by Nikos Angelidis on 11/5/23.
//

import Foundation

struct HTTPMethod: RawRepresentable {
    static let get = HTTPMethod(rawValue: "GET")
    static let post = HTTPMethod(rawValue: "POST")
    
    let rawValue: String
    
    init(rawValue: String) {
        self.rawValue = rawValue
    }
}
