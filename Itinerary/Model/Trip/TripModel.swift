//
//  TripModel.swift
//  Itinerary
//
//  Created by hanho on 3/4/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import Foundation



class TripModel {
    let id: UUID
    var title: String
    
    
    init(title: String) {
        id = UUID()
        self.title = title
    }
}
