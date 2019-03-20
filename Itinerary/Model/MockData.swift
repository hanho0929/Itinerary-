//
//  MockData.swift
//  Itinerary
//
//  Created by hanho on 3/13/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import Foundation


class MockData {
    static func createMockTripModelData() -> [TripModel] {
        var mockTrips = [TripModel]()
        mockTrips.append(TripModel(title: "Photo", image: nil, dayModels: createMockDayModelData()))
        return mockTrips
    }
    
    
    static func createMockDayModelData() -> [DayModel] {
        var dayModels = [DayModel]()
        
        dayModels.append(DayModel(title: "April 18", subtitle: "Departure", data: createMockActivityModelData(sectionTitle: "April 18")))
        
        dayModels.append(DayModel(title: "April 19", subtitle: "Exploring", data: createMockActivityModelData(sectionTitle: "April 19")))
        
        return dayModels
    }
    
    
    
    static func createMockActivityModelData(sectionTitle: String) -> [ActivityModel] {
        var activityModels = [ActivityModel]()
        
        
        if sectionTitle == "April 18" {
            activityModels.append(ActivityModel(title: "Test", subTitle: "Test2", activityType: .children))
            activityModels.append(ActivityModel(title: "Test2", subTitle: "Test2", activityType: .food))
        } else if sectionTitle == "April 19" {
            activityModels.append(ActivityModel(title: "Test3", subTitle: "Test2", activityType: .pet))
            activityModels.append(ActivityModel(title: "Test4", subTitle: "Test2", activityType: .school))
        }
        
        
        return activityModels
    }
}
