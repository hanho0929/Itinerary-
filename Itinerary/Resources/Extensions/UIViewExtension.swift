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
    
    func bounce() {
        self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.1, options: .beginFromCurrentState, animations: {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
}
