//
//  TripModel.swift
//  Itinerary
//
//  Created by hanho on 3/4/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit

class TripModel {
    let id: UUID
    var title: String
    var image: UIImage?
    
    
    init(title: String, image: UIImage? = nil) {
        id = UUID()
        self.title = title
        self.image = image
    }
}
