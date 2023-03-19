//
//  DVDCountry.swift
//  Movies
//
//  Created by Nikos Aggelidis on 19/3/23.
//

import Foundation
import RealmSwift

@objc final class DVDCountry: NSObject, Codable {
    @objc dynamic var name: String = ""
    @objc dynamic var code: String = ""
    @objc dynamic var timezone: String = ""
    
    init(
        name: String,
        code: String,
        timezone: String
    ) {
        self.name = name
        self.code = code
        self.timezone = timezone
    }
}
