//
//  AppUIButton.swift
//  Itinerary
//
//  Created by hanho on 3/9/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit

class AppUIButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = Theme.tintColor
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)
    }

}
