//
//  TripsTableViewCell.swift
//  Itinerary
//
//  Created by hanho on 3/6/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.addRoundedAndConerRadius()
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 60)
        cardView.backgroundColor = UIColor(named: "Accent")
    }
    
    
    func setUp(tripModel: TripModel) {
        titleLabel.text = tripModel.title
    }



}