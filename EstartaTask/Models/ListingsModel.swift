//
//  listingsModel.swift
//  EstartaTask
//
//  Created by Tawfik Sweedy✌️ on 12/5/22.
//

import Foundation

struct ListingsModel : Codable , Hashable {
    let results : [Results]?
    let pagination : Pagination?

    enum CodingKeys: String, CodingKey {

        case results = "results"
        case pagination = "pagination"
    }


}

struct Results : Codable , Hashable {
    let created_at : String?
    let price : String?
    let name : String?
    let uid : String?
    let image_ids : [String]?
    let image_urls : [String]?
    let image_urls_thumbnails : [String]?
    var show : Bool?
    

    enum CodingKeys: String, CodingKey {

        case created_at = "created_at"
        case price = "price"
        case name = "name"
        case uid = "uid"
        case image_ids = "image_ids"
        case image_urls = "image_urls"
        case image_urls_thumbnails = "image_urls_thumbnails"
        case show = "show"
    }


}

struct Pagination : Codable , Hashable {
    let key : String?

    enum CodingKeys: String, CodingKey {

        case key = "key"
    }


}
