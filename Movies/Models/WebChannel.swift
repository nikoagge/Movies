//
//  WebChannel.swift
//  Movies
//
//  Created by Nikos Aggelidis on 19/3/23.
//

import Foundation
import RealmSwift

@objc final class WebChannel: NSObject, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    let country: Country?
    let officialSite: String?
    
    init(
        id: Int,
        name: String,
        country: Country?,
        officialSite: String?
    ) {
        self.id = id
        self.name = name
        self.country = country
        self.officialSite = officialSite
    }
}
