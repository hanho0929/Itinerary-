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
                Data.tripModels.append(TripModel(title: "Photo"))
                Data.tripModels.append(TripModel(title: "Relationship"))
                Data.tripModels.append(TripModel(title: "Journey"))
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
