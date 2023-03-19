//
//  RealmManager.swift
//  Movies
//
//  Created by Nikos Aggelidis on 19/3/23.
//

import Foundation
import RealmSwift

protocol RealmManagerType {
    func addRealmShow(_ serviceShow: ServiceShow)
    func loadRealmShows()
    func printPath()
}

final class RealmManager: RealmManagerType {
    var realm: Realm?
    
    init() {
        do {
            realm = try Realm()
        } catch {
            debugPrint("Ooops better luck next time! :)")
        }
    }
    
    func printPath() {
        debugPrint(realm?.configuration.fileURL ?? "better luck next time :)")
    }
    
    func addRealmShow(_ serviceShow: ServiceShow) {
        let realmShow = RealmShow()
        realmShow.loadFrom(serviceShow: serviceShow)
        do {
            try realm?.write{
                realm?.add(realmShow)
            }
        } catch {
            debugPrint(error)
        }
    }
    
    func loadRealmShows() {
        realmShows = realm?.objects(RealmShow.self)
    }
}
