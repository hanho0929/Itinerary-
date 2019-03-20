//
//  TripModel.swift
//  Itinerary
//
//  Created by hanho on 3/4/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit

struct TripModel {
    let id: UUID
    var title: String
    var image: UIImage?
    var dayModels = [DayModel]()
    
    
    
    init(title: String, image: UIImage? = nil, dayModels: [DayModel]? = nil) {
        id = UUID()
        self.title = title
        self.image = image
        if let dayModels = dayModels {
            self.dayModels = dayModels
        }
    }
}
