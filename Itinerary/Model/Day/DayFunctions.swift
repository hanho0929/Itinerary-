//
//  DayFunctions.swift
//  Itinerary
//
//  Created by hanho on 3/21/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import Foundation


class DayFunctions {
    static func createDay(tripIndex: Int, dayModel: DayModel) {
        // Replace withe real data store code
        
        Data.tripModels[tripIndex].dayModels.append(dayModel)
        
    }
}
