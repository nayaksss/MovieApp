//
//  MoviesModel.swift
//  MoviesApp
//
//  Created by Vinayak T on 21/04/23.
//

import Foundation

struct MoviesModel : Decodable {
    let resultCount : Int?
    var results : [Results]?
}

struct Results : Codable {
    var isSelectedCheckBox: Bool? = false
    let artistName : String?
    let collectionName : String?
    var artworkUrl100 : String?

    /*let kind : String?
     let wrapperType : String?
    let artistId : Int?
    let collectionId : Int?
    let trackId : Int?
    let artistName : String?
    let trackName : String?
    let trackName : String?
    let collectionCensoredName : String?
    let trackCensoredName : String?
    let artistViewUrl : String?
    let collectionViewUrl : String?
    let trackViewUrl : String?
    let previewUrl : String?
    let artworkUrl30 : String?
    let artworkUrl60 : String?
    let artworkUrl100 : String?
    let collectionPrice : Double?
    let trackPrice : Double?
    let releaseDate : String?
    let collectionExplicitness : String?
    let trackExplicitness : String?
    let discCount : Int?
    let discNumber : Int?
    let trackCount : Int?
    let trackNumber : Int?
    let trackTimeMillis : Int?
    let country : String?
    let currency : String?
    let primaryGenreName : String?
    let isStreamable : Bool?
*/
    /*
    enum CodingKeys: String, CodingKey {

        case wrapperType = "wrapperType"
        case kind = "kind"
        case artistId = "artistId"
        case collectionId = "collectionId"
        case trackId = "trackId"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case trackName = "trackName"
        case collectionCensoredName = "collectionCensoredName"
        case trackCensoredName = "trackCensoredName"
        case artistViewUrl = "artistViewUrl"
        case collectionViewUrl = "collectionViewUrl"
        case trackViewUrl = "trackViewUrl"
        case previewUrl = "previewUrl"
        case artworkUrl30 = "artworkUrl30"
        case artworkUrl60 = "artworkUrl60"
        case artworkUrl100 = "artworkUrl100"
        case collectionPrice = "collectionPrice"
        case trackPrice = "trackPrice"
        case releaseDate = "releaseDate"
        case collectionExplicitness = "collectionExplicitness"
        case trackExplicitness = "trackExplicitness"
        case discCount = "discCount"
        case discNumber = "discNumber"
        case trackCount = "trackCount"
        case trackNumber = "trackNumber"
        case trackTimeMillis = "trackTimeMillis"
        case country = "country"
        case currency = "currency"
        case primaryGenreName = "primaryGenreName"
        case isStreamable = "isStreamable"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        wrapperType = try values.decodeIfPresent(String.self, forKey: .wrapperType)
        kind = try values.decodeIfPresent(String.self, forKey: .kind)
        artistId = try values.decodeIfPresent(Int.self, forKey: .artistId)
        collectionId = try values.decodeIfPresent(Int.self, forKey: .collectionId)
        trackId = try values.decodeIfPresent(Int.self, forKey: .trackId)
        artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
        collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName)
        trackName = try values.decodeIfPresent(String.self, forKey: .trackName)
        collectionCensoredName = try values.decodeIfPresent(String.self, forKey: .collectionCensoredName)
        trackCensoredName = try values.decodeIfPresent(String.self, forKey: .trackCensoredName)
        artistViewUrl = try values.decodeIfPresent(String.self, forKey: .artistViewUrl)
        collectionViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionViewUrl)
        trackViewUrl = try values.decodeIfPresent(String.self, forKey: .trackViewUrl)
        previewUrl = try values.decodeIfPresent(String.self, forKey: .previewUrl)
        artworkUrl30 = try values.decodeIfPresent(String.self, forKey: .artworkUrl30)
        artworkUrl60 = try values.decodeIfPresent(String.self, forKey: .artworkUrl60)
        artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
        collectionPrice = try values.decodeIfPresent(Double.self, forKey: .collectionPrice)
        trackPrice = try values.decodeIfPresent(Double.self, forKey: .trackPrice)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        collectionExplicitness = try values.decodeIfPresent(String.self, forKey: .collectionExplicitness)
        trackExplicitness = try values.decodeIfPresent(String.self, forKey: .trackExplicitness)
        discCount = try values.decodeIfPresent(Int.self, forKey: .discCount)
        discNumber = try values.decodeIfPresent(Int.self, forKey: .discNumber)
        trackCount = try values.decodeIfPresent(Int.self, forKey: .trackCount)
        trackNumber = try values.decodeIfPresent(Int.self, forKey: .trackNumber)
        trackTimeMillis = try values.decodeIfPresent(Int.self, forKey: .trackTimeMillis)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
        primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
        isStreamable = try values.decodeIfPresent(Bool.self, forKey: .isStreamable)
    }
*/
}





/*
struct MoviesModel: Codable {
    let resultCount: Int
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let wrapperType: WrapperType?
    let kind: Kind?
    let artistID, collectionID, trackID: Int?
    let artistName, collectionName, trackName, collectionCensoredName: String?
    let trackCensoredName: String?
    let artistViewURL, collectionViewURL, trackViewURL: String?
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    let collectionPrice, trackPrice: Double?
    let releaseDate: Date?
    let collectionExplicitness, trackExplicitness: Explicitness?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int?
    let country: Country?
    let currency: Currency?
    let primaryGenreName: String?
    let isStreamable: Bool?
    let collectionArtistID: Int?
    let collectionArtistName: String?
    let collectionArtistViewURL: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, isStreamable
        case collectionArtistID = "collectionArtistId"
        case collectionArtistName
        case collectionArtistViewURL = "collectionArtistViewUrl"
    }
}

enum Explicitness: String, Codable {
    case notExplicit = "notExplicit"
}

enum Country: String, Codable {
    case usa = "USA"
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum Kind: String, Codable {
    case song = "song"
}

enum WrapperType: String, Codable {
    case track = "track"
}
*/
