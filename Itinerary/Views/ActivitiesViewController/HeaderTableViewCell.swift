//
//  HeaderTableViewCell.swift
//  Itinerary
//
//  Created by hanho on 3/15/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
//    static let identifier = String(describing: self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.font = UIFont(name: Theme.bodyFontNameBold, size: 17)
        subtitleLabel.font = UIFont(name: Theme.bodyFontName, size: 15)
    }

    
    func setup(model: DayModel) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        
        titleLabel.text = formatter.string(from: model.title)
        subtitleLabel.text = model.subtitle
    }

}
