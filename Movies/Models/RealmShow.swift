//
//  RealmShow.swift
//  Movies
//
//  Created by Nikos Aggelidis on 19/3/23.
//

import Foundation
import RealmSwift

final class RealmShow: Object {
    @objc dynamic var imageMedium: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var language: String = ""
    @objc dynamic var rating: Double = 0
    
    func loadFrom(serviceShow: ServiceShow) {
        imageMedium = serviceShow.image?.medium ?? ""
        name = serviceShow.name ?? ""
        type = serviceShow.type ?? ""
        language = serviceShow.language ?? ""
        rating = serviceShow.rating?.average ?? 0
    }
}
