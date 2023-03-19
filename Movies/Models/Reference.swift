//
//  Reference.swift
//  Movies
//
//  Created by Nikos Aggelidis on 18/3/23.
//

import Foundation
import RealmSwift

@objc final class Reference: NSObject, Codable {
    @objc dynamic var href: String = ""
    
    init(
        href: String
    ) {
        self.href = href
    }
}
