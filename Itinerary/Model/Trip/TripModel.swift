//
//  TripModel.swift
//  Itinerary
//
//  Created by hanho on 3/4/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import Foundation



class TripModel {
    var id: String!
    var title: String!
    
    
    init(title: String) {
        id = UUID().uuidString
        self.title = title
    }
}
