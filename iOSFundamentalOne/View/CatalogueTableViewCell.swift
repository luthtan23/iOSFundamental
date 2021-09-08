//
//  CatalogueTableViewCell.swift
//  iOSFundamentalOne
//
//  Created by iei19100007 on 23/08/21.
//

import UIKit

class CatalogueTableViewCell: UITableViewCell {

    @IBOutlet var imageBackground: UIImageView!
    @IBOutlet var viewBackground: UIView!
    @IBOutlet var titleText: UILabel!
    @IBOutlet var dateText: UILabel!
    @IBOutlet var ratingInt: UILabel!
    @IBOutlet var topRatingInt: UILabel!
	
	
	func setUICell(gameList: GamesListResponse, loadImage: LoadImage) {
		titleText.text = gameList.name
		dateText.text = gameList.released
		ratingInt.text = String(gameList.rating!)
		topRatingInt.text = "/" + String(gameList.ratingTop!)
		imageBackground.image = loadImage.image
	}
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewBackground.layer.cornerRadius = 20.0
        viewBackground.layer.shadowColor = UIColor.gray.cgColor
        viewBackground.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        viewBackground.layer.shadowRadius = 12.0
        viewBackground.layer.shadowOpacity = 0.7
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
    
}
