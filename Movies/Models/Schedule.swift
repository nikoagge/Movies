//
//  Schedule.swift
//  Movies
//
//  Created by Nikos Aggelidis on 18/3/23.
//

import Foundation
import RealmSwift

@objc final class Schedule: NSObject, Codable {
    @objc dynamic var time: String = ""
    @objc dynamic var days: [String] = []
    
    init(
        time: String,
        days: [String]
    ) {
        self.time = time
        self.days = days
    }
}
