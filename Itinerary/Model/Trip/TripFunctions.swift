//
//  Test.swift
//  Itinerary
//
//  Created by hanho on 3/4/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import Foundation


class TripFunctions {
    static func createTrip(tripModel: TripModel) {
        
    }
    
    static func readTrips(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Test1"))
                Data.tripModels.append(TripModel(title: "Test2"))
                Data.tripModels.append(TripModel(title: "Test3"))
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
        
        
        
    }
    
    
    static func updateTrip(tripModel: TripModel) {
        
    }
    
    
    static func deleteTrip(tripModel: TripModel) {
        
    }
    
    
}
