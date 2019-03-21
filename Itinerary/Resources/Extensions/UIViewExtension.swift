//
//  UIViewExtensions.swift
//  Itinerary
//
//  Created by hanho on 3/6/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit


extension UIView {
    func addShadowAndRoundedCorner() {
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
    }
    
}
