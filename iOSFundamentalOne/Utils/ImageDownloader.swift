//
//  ImageDownloader.swift
//  iOSFundamentalOne
//
//  Created by iei19100004 on 08/09/21.
//

import Foundation
import UIKit

class ImageDownloader: Operation {
	private var _loadImage: LoadImage

	init(loadImage: LoadImage) {
		_loadImage = loadImage
	}

	override func main() {
		if isCancelled {
			return
		}

		guard let imageData = try? Data(contentsOf: _loadImage.poster) else { return }

		if isCancelled {
			return
		}

		if !imageData.isEmpty {
			_loadImage.image = UIImage(data: imageData)
			_loadImage.state = .downloaded
		} else {
			_loadImage.image = nil
			_loadImage.state = .failed
		}
	}
}

class PendingOperations {
	lazy var downloadInProgress: [IndexPath: Operation] = [:]

	lazy var downloadQueue: OperationQueue = {
		var queue = OperationQueue()
		queue.name = "com.luthtan.imagedownloader"
		queue.maxConcurrentOperationCount = 2
		return queue
	}()
}
