//
//  TripsTableViewCell.swift
//  Itinerary
//
//  Created by hanho on 3/6/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.addShadowAndRoundedCorner()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 32)
        cardView.backgroundColor = UIColor(named: "Accent")
        tripImageView.layer.cornerRadius = cardView.layer.cornerRadius
    }
    
    
    func setUp(tripModel: TripModel) {
        titleLabel.text = tripModel.title
        
        if let tripImage = tripModel.image {
            tripImageView.alpha = 0.3
            tripImageView.image = tripImage
            UIView.animate(withDuration: 1) {
                self.tripImageView.alpha = 1
            }
        }
        
        
        // tripImageView.image = tripModel.image
    }



}
