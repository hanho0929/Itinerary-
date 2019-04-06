//
//  UIColorExtension.swift
//  Itinerary
//
//  Created by hanho on 4/3/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(colorWithHexValue value: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((value & 0xFF000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x000FF) / 255.0,
            alpha: alpha
        )
    }
}
