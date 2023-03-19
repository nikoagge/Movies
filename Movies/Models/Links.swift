//
//  Links.swift
//  Movies
//
//  Created by Nikos Aggelidis on 18/3/23.
//

import Foundation
import RealmSwift

@objc final class Links: NSObject, Codable {
    @objc dynamic var linksSelf: Reference = Reference(
        href: ""
    )
    @objc dynamic var previousEpisode: Reference = Reference(
        href: ""
    )
    
    init(
        linksSelf: Reference,
        previousEpisode: Reference
    ) {
        self.linksSelf = linksSelf
        self.previousEpisode = previousEpisode
    }
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case previousEpisode = "previousepisode"
    }
}
