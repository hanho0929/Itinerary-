//
//  DayModel.swift
//  Itinerary
//
//  Created by hanho on 3/13/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import Foundation


struct DayModel {
    var id: UUID
    var title = ""
    var subtitle = ""
    var activityModels = [ActivityModel]()
    
    init(title: String, subtitle: String, data: [ActivityModel]?) {
        id = UUID()
        self.title = title
        self.subtitle = subtitle
        
        if let data = data {
            self.activityModels = data
        }
        
    }
}
