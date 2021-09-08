//
//  NetworkResponse.swift
//  iOSFundamentalOne
//
//  Created by iei19100004 on 08/09/21.
//

import Foundation
import UIKit

struct Constant {
	static let baseUrl = "https://api.rawg.io/api/"
	static let apiKey = "3a255f374a0f4970ba139e491ca1a5fc"
	static let gameList = "games"
	static let detailGame = "games/3498"
}

struct NetworkResponse: Codable {
	let count: Int?
	let next: String?
	let previous: String?
	let results: [GamesListResponse]
	
	
	enum CodingKeys: String, CodingKey {
		case count
		case next
		case previous
		case results
	}
}

struct GamesListResponse: Codable {
	let id: Int?
	let name: String?
	let rating: Double?
	let ratingTop: Double?
	let released: String?
	let backgroundImage: String?
	

	enum CodingKeys: String, CodingKey {
		case id
		case name
		case rating
		case ratingTop = "rating_top"
		case released
		case backgroundImage = "background_image"
	}
}

class LoadImage {
	var id: Int?
	let poster: URL

	var image: UIImage?
	var state: DownloadState = .new
	
	init(id: Int, poster: URL) {
		self.id = id
		self.poster = poster
	}
}

struct GameDetail: Codable {
	
}

enum DownloadState {
	case new, downloaded, failed
}
