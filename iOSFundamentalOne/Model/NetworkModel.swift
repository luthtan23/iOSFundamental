//
//  NetworkModel.swift
//  iOSFundamentalOne
//
//  Created by iei19100007 on 30/08/21.
//

import Foundation
import UIKit

struct NetworkModel: Codable {
    var count: Int64?
    var next: String?
    var previous: String?
    var result: [GamesModel]
    var nofollowCollection: [String]?

    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case result
        case nofollowCollection = "nofollow_collections"
    }
}
