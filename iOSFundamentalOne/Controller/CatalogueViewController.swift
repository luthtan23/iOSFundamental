//
//  CatalogueViewController.swift
//  iOSFundamentalOne
//
//  Created by iei19100007 on 23/08/21.
//

import UIKit

class CatalogueViewController: UIViewController {
    
    @IBOutlet var catalogueTableView: UITableView!
	
	private var gameList = [GamesListResponse]()
	private var loadImages = [LoadImage]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        setupView()
		setupNetworking()

		
    }
	
	
	override func viewWillAppear(_ animated: Bool) {
		
	}
    
    private func setupView() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.title = CATALOGUE_TITLE
        
        catalogueTableView = UITableView(frame: self.view.bounds)
        catalogueTableView.register(UINib(nibName: "CatalogueTableViewCell", bundle: nil), forCellReuseIdentifier: CELLID)
        catalogueTableView.delegate = self
        catalogueTableView.dataSource = self
        catalogueTableView.separatorStyle = .none
        
        self.view.addSubview(catalogueTableView)
    }
	
	private func setupNetworking() {
		networkHelper(parameterUrl: Constant.gameList, responseData: { responseData in
			self.gameList = decodeGameListResponse(data: responseData)
			self.gameList.forEach{ game in
				self.loadImages.append(LoadImage(id: game.id!, poster: URL(string: game.backgroundImage!)!))
			}
			DispatchQueue.main.async {
				self.catalogueTableView.reloadData()
			}
		})
	}
	
	private let _pendingOperations = PendingOperations()
	
	fileprivate func startOperations(loadImage: LoadImage, indexPath: IndexPath) {
			if loadImage.state == .new {
				startDownload(loadImage: loadImage, indexPath: indexPath)
			}
		}

		fileprivate func startDownload(loadImage: LoadImage, indexPath: IndexPath) {
			guard _pendingOperations.downloadInProgress[indexPath] == nil else { return }

			let downloader = ImageDownloader(loadImage: loadImage)
			downloader.completionBlock = {
				if downloader.isCancelled { return }

				DispatchQueue.main.async {
					self._pendingOperations.downloadInProgress.removeValue(forKey: indexPath)
					self.catalogueTableView.reloadRows(at: [indexPath], with: .automatic)
				}
			}

			_pendingOperations.downloadInProgress[indexPath] = downloader
			_pendingOperations.downloadQueue.addOperation(downloader)
		}

		fileprivate func toggleSuspendOperations(isSuspended: Bool) {
			_pendingOperations.downloadQueue.isSuspended = isSuspended
		}

}

extension CatalogueViewController: UITableViewDelegate {
    
}

extension CatalogueViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return gameList.count
    }
    
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = catalogueTableView.dequeueReusableCell(withIdentifier: CELLID, for: indexPath) as? CatalogueTableViewCell {
			let game = self.gameList[indexPath.row]
			let loadImage = loadImages[indexPath.row]
			
			cell.setUICell(gameList: game, loadImage: loadImage)
						
			if loadImage.state == .new {
				if !tableView.isDragging && !tableView.isDecelerating {
					startOperations(loadImage: loadImage, indexPath: indexPath)
				}
			}
			return cell
		} else {
			return UITableViewCell()
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
    
    
}

extension CatalogueViewController: UIScrollViewDelegate {
	func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
		toggleSuspendOperations(isSuspended: true)
	}

	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		toggleSuspendOperations(isSuspended: false)
	}
	
}
