//
//  Links.swift
//  Movies
//
//  Created by Nikos Aggelidis on 18/3/23.
//

import Foundation

struct Links: Codable {
    let linksSelf: Reference?
    let previousEpisode: Reference?
    let nextEpisode: Reference?
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case previousEpisode = "previousepisode"
        case nextEpisode = "nextepisode"
    }
}
