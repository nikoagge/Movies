//
//  Links.swift
//  Movies
//
//  Created by Nikos Aggelidis on 18/3/23.
//

import Foundation

struct Links: Codable {
    let `self`: Reference
    let previousEpisode: Reference
    
    enum CodingKeys: String, CodingKey {
        case `self`
        case previousEpisode = "previousepisode"
    }
}
