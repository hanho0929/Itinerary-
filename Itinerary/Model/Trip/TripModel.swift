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
    var dayModels = [DayModel]() {
        didSet {
            // Called when a new value is assigned to dayModels
//            dayModels = dayModels.sorted(by: {$0.title < $1.title})
            
            dayModels = dayModels.sorted(by: <)
        }
    }
    
    
    
    init(title: String, image: UIImage? = nil, dayModels: [DayModel]? = nil) {
        id = UUID()
        self.title = title
        self.image = image
        if let dayModels = dayModels {
            self.dayModels = dayModels
        }
    }
}
