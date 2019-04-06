//
//  UIButtonExtension.swift
//  Itinerary
//
//  Created by hanho on 3/8/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit

extension UIButton {
    func createFloatingActionButton() {
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
}
