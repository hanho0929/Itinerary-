//
//  UIViewControllerExtension.swift
//  Itinerary
//
//  Created by hanho on 3/20/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit


extension UIViewController {
    
    /**
     Return the initial view controller on a storyboard
    */
    static func getInstance() -> UIViewController {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController()!
    }
}
