//
//  Show.swift
//  Movies
//
//  Created by Nikos Aggelidis on 18/3/23.
//

import Foundation
import RealmSwift

final class Show: Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var url: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var language: String = ""
    @objc dynamic var genres: [String] = []
    @objc dynamic var status: String = ""
    let runtime: Int?
    @objc dynamic var averageRuntime: Int = 0
    @objc dynamic var premiered: String = ""
    let ended: String?
    let officialSite: String?
    @objc dynamic var schedule: Schedule = Schedule(
        time: "",
        days: []
    )
    @objc dynamic var rating: Rating = Rating(
        average: 0
    )
    @objc dynamic var weight: Int = 0
    let network: Network?
    let webChannel: WebChannel?
    let dvdCountry: DVDCountry?
    @objc dynamic var externals: Externals = Externals(
        tvrage: 0,
        thetvdb: 0,
        imdb: ""
    )
    @objc dynamic var image: Image = Image(
        medium: "",
        original: ""
    )
    @objc dynamic var summary: String = ""
    @objc dynamic var updated: Int = 0
    @objc dynamic var links: Links = Links(
        linksSelf: Reference(
            href: ""
        ),
        previousEpisode: Reference(
            href: ""
        )
    )
    
    init(
        id: Int,
        url: String,
        name: String,
        type: String,
        language: String,
        genres: [String],
        status: String,
        runtime: Int?,
        averageRuntime: Int,
        premiered: String,
        ended: String?,
        officialSite: String?,
        schedule: Schedule,
        rating: Rating,
        weight: Int,
        network: Network?,
        webChannel: WebChannel?,
        dvdCountry: DVDCountry?,
        externals: Externals,
        image: Image,
        summary: String,
        updated: Int,
        links: Links
    ) {
        self.id = id
        self.url = url
        self.name = name
        self.type = type
        self.language = language
        self.genres = genres
        self.status = status
        self.runtime = runtime
        self.averageRuntime = averageRuntime
        self.premiered = premiered
        self.ended = ended
        self.officialSite = officialSite
        self.schedule = schedule
        self.rating = rating
        self.weight = weight
        self.network = network
        self.webChannel = webChannel
        self.dvdCountry = dvdCountry
        self.externals = externals
        self.image = image
        self.summary = summary
        self.updated = updated
        self.links = links
    }
    
    enum CodingKeys: String, CodingKey {
        case id, url, name, type, language, genres, status, runtime, averageRuntime, premiered, ended, officialSite, schedule, rating, weight, network, webChannel, dvdCountry, externals, image, summary, updated
        case links = "_links"
    }
}
