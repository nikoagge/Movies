//
//  Externals.swift
//  Movies
//
//  Created by Nikos Aggelidis on 18/3/23.
//

import Foundation
import RealmSwift

@objc final class Externals: NSObject, Codable {
    @objc dynamic var tvrage: Int = 0
    let thetvdb: Int?
    let imdb: String?
    
    init(
        tvrage: Int,
        thetvdb: Int?,
        imdb: String?
    ) {
        self.tvrage = tvrage
        self.thetvdb = thetvdb
        self.imdb = imdb
    }
}
