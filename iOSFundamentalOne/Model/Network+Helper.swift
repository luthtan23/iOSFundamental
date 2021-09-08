//
//  Network+Helper.swift
//  iOSFundamentalOne
//
//  Created by iei19100007 on 30/08/21.
//

import UIKit

func networkHelper(parameterUrl: String, responseData: @escaping(Data) -> ()) {

	var components = URLComponents(string: Constant.baseUrl + parameterUrl)!
    
	components.queryItems = [URLQueryItem(name: "key", value: Constant.apiKey)]
	
	let request = URLRequest(url: components.url!)
	
	let task = URLSession.shared.dataTask(with: request) { data, response, error in
		guard let response = response as? HTTPURLResponse, let data = data else { return }
		
		if response.statusCode == 200 {
			responseData(data)
		} else {
			print("ERROR: \(data), HTTP Status: \(response.statusCode)")
		}
	}
	
	task.resume()
    
}


func decodeGameListResponse(data: Data) -> [GamesListResponse] {
	let decoder = JSONDecoder()
	
	var games = [GamesListResponse]()

	if let gamesList = try? decoder.decode(NetworkResponse.self, from: data) as NetworkResponse {
		gamesList.results.forEach { game in
			games.append(game)
//			print("\(game)")
		}
	} else {
		print("error Json Decode")
	}
	
	return games
}


func decodeDetailGame(data: Data) {
	let decoder = JSONDecoder()
	
	if let gamesList = try? decoder.decode(GameDetail.self, from: data) as GameDetail {
		
	} else {
		print("error Json Decode")
	}
}
