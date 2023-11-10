//
//  JSONManager.swift
//  MTG_APP
//
//  Created by MacBook Pro on 10/11/23.
//

import Foundation
// Define the Codable structs to map the JSON structure
struct CardList: Codable {
    var object: String
    var totalCards: Int
    var hasMore: Bool
    var data: [Card]
    
    enum CodingKeys: String, CodingKey {
        case object
        case totalCards = "total_cards"
        case hasMore = "has_more"
        case data
    }
}

struct Card: Codable {
    var object: String
    var id: String
    var name: String
    var imageUris: ImageUris?
    var manaCost: String?
    var typeLine: String
    var oracleText: String?
    var colors: [String]?
    var prices: Prices?
    var foil: Bool? // Add this line to include the foil property

    
    enum CodingKeys: String, CodingKey {
        case object
        case id
        case name
        case imageUris = "image_uris"
        case manaCost = "mana_cost"
        case typeLine = "type_line"
        case oracleText = "oracle_text"
        case colors
    }
}
struct Prices: Codable {
    var usd: String?
    var usdFoil: String?
    
    enum CodingKeys: String, CodingKey {
        case usd
        case usdFoil = "usd_foil"
    }
}
struct ImageUris: Codable {
    var small: URL
    var normal: URL
    var large: URL?
    var png: URL?
    var artCrop: URL?
    var borderCrop: URL?
    
    enum CodingKeys: String, CodingKey {
        case small
        case normal
        case large
        case png
        case artCrop = "art_crop"
        case borderCrop = "border_crop"
    }
}
