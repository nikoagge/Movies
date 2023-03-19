//
//  WebChannel.swift
//  Movies
//
//  Created by Nikos Aggelidis on 19/3/23.
//

import Foundation

struct WebChannel: Codable {
    let id: Int?
    let name: String?
    let country: Country?
    let officialSite: String?
}
