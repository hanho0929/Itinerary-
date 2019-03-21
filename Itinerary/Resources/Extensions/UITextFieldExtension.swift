//
//  UITextFieldExtension.swift
//  Itinerary
//
//  Created by hanho on 3/21/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit

extension UITextField {
    var hasValue: Bool {
        guard text == "" else { return true }
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        placeholder = "Required"
        
        return false
    }
    
}
