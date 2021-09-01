//
//  PlatformModel.swift
//  iOSFundamentalOne
//
//  Created by iei19100007 on 30/08/21.
//
import Foundation
import UIKit

struct PlatformModel: Codable {
    var platform: [PlatformDetailModel]?
    var releasedAt: String?
    var requirementsEn: String?
    var requirementsRu: String?

    enum CodingKeys: String, CodingKey {
        case platform
        case releasedAt = "released_at"
        case requirementsEn = "requirements_en"
        case requirementsRu = "requirements_ru"
    }
}
