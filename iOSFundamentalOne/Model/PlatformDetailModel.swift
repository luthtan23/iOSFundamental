//
//  PlatformDetailModel.swift
//  iOSFundamentalOne
//
//  Created by iei19100007 on 30/08/21.
//

import UIKit

struct PlatformDetailModel: Codable {
    var id: Int32?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
