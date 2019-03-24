//
//  ActivityFunctions.swift
//  Itinerary
//
//  Created by hanho on 3/23/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import Foundation


class ActivityFunctions {
    static func createActivity(at tripIndex: Int, for dayIndex: Int, using activityModel: ActivityModel) {
        // Replace withe real data store code
        
        Data.tripModels[tripIndex].dayModels[dayIndex].activityModels.append(activityModel)
        
    }
}
