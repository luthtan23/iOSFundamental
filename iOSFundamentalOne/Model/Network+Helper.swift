//
//  Network+Helper.swift
//  iOSFundamentalOne
//
//  Created by iei19100007 on 30/08/21.
//

import UIKit



func networkHelper() -> Bool {

    let apiKey = "3a255f374a0f4970ba139e491ca1a5fc"

    var components = URLComponents(string: "https://api.rawg.io/api/games")!
    
    components.queryItems = [URLQueryItem(name: "key", value: apiKey)]
    
    
    return true
}
