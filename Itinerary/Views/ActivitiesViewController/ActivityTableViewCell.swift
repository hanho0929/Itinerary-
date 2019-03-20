//
//  ActivityTableViewCell.swift
//  Itinerary
//
//  Created by hanho on 3/16/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.addShadowAndRoundedCorner()
        titleLabel.font = UIFont(name: Theme.bodyFontNameDemiBold, size: 17)
        subtitleLabel.font = UIFont(name: Theme.bodyFontName, size: 17)
    }
    
    
    func setUp(model: ActivityModel) {
        activityImageView.image = getActivityImageView(type: model.activityType)
        titleLabel.text = model.title
        subtitleLabel.text = model.subTitle
    }
    
    func getActivityImageView(type: ActivityType) -> UIImage {
        switch type {
        case .school:
            return #imageLiteral(resourceName: "school")
        case .children:
            return #imageLiteral(resourceName: "children")
        case .food:
            return #imageLiteral(resourceName: "food")
        case .pet:
            return #imageLiteral(resourceName: "pet")
        }
        
    }
}
