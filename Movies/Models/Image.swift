//
//  Image.swift
//  Movies
//
//  Created by Nikos Aggelidis on 18/3/23.
//

import Foundation
import RealmSwift

@objc final class Image: NSObject, Codable {
    @objc dynamic var medium: String = ""
    @objc dynamic var original: String = ""
    
    init(
        medium: String,
        original: String
    ) {
        self.medium = medium
        self.original = original
    }
}
