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
    func replace(shows: [ServiceShow])
    func anotherFetchShows(onCompletion: @escaping (([RealmShow]?) -> Void))
    func printPath()
}

final class RealmManager: RealmManagerType {
    static let shared = RealmManager()
    
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
        listOfRealmShows = realm?.objects(RealmShow.self)
    }
    
    func fetchShows() -> [RealmShow] {
        guard let realm = realm else { return [] }
        return Array(realm.objects(RealmShow.self))
    }
    
    func anotherFetchShows(onCompletion: @escaping (([RealmShow]?) -> Void)) {
        guard let realm = realm else {
            onCompletion(nil)
            
            return
        }
        
        onCompletion(Array(realm.objects(RealmShow.self)))
    }
    
    func replace(shows: [ServiceShow]) {
    }
}
