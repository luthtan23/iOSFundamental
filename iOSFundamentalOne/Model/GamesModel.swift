//
//  GamesModel.swift
//  iOSFundamentalOne
//
//  Created by iei19100007 on 30/08/21.
//

import Foundation
import UIKit

struct GamesModel: Codable {
    var id: Int32?
    var name: String?
    var released: String?
    var backgroundImage: String?
    var rating: String?
    var ratingTop: String?
    var platforms: [PlatformModel]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case platforms
    }
}
