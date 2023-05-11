//
//  ServiceShow.swift
//  Movies
//
//  Created by Nikos Aggelidis on 18/3/23.
//

import Foundation

struct ServiceShow: Codable {
    let id: Int?
    let url: String?
    let name: String?
    let type: String?
    let language: String?
    let genres: [String] = []
    let status: String?
    let runtime: Int?
    let averageRuntime: Int?
    let premiered: String?
    let ended: String?
    let officialSite: String?
    let schedule: Schedule?
    let rating: Rating?
    let weight: Int?
    let network: Network?
    let webChannel: WebChannel?
    let dvdCountry: DVDCountry?
    let externals: Externals?
    let image: Image?
    let summary: String?
    let updated: Int?
    let links: Links?
    
    enum CodingKeys: String, CodingKey {
        case id, url, name, type, language, genres, status, runtime, averageRuntime, premiered, ended, officialSite, schedule, rating, weight, network, webChannel, dvdCountry, externals, image, summary, updated
        case links = "_links"
    }
}
