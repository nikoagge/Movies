//
//  Rating.swift
//  Movies
//
//  Created by Nikos Aggelidis on 18/3/23.
//

import Foundation
import RealmSwift

@objc final class Rating: NSObject, Codable {
    let average: Double?
    
    init(
        average: Double?
    ) {
        self.average = average
    }
}
