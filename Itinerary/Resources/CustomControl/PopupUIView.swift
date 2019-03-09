//
//  PopupUIView.swift
//  Itinerary
//
//  Created by hanho on 3/9/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit

class PopupUIView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
        backgroundColor = Theme.backgroundColor
    }

}
