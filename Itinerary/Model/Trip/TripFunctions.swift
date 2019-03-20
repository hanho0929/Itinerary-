//
//  Test.swift
//  Itinerary
//
//  Created by hanho on 3/4/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit


class TripFunctions {
    static func createTrip(tripModel: TripModel) {
        Data.tripModels.append(tripModel)
    }
    
    static func readTrips(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInitiated).async {
            if Data.tripModels.count == 0 {
                Data.tripModels = MockData.createMockTripModelData()
//                Data.tripModels.append(TripModel(title: "Photo"))
//                Data.tripModels.append(TripModel(title: "Relationship"))
//                Data.tripModels.append(TripModel(title: "Journey"))
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    
    static func readTrip(by id: UUID, completion: @escaping (TripModel?) -> ()) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            let trip = Data.tripModels.first(where: {$0.id == id})
            
            DispatchQueue.main.async {
                completion(trip)
            }
        }
    }
    
    
    static func updateTrip(at index: Int, title: String, image: UIImage? = nil) {
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image
    }
    
    
    static func deleteTrip(index: Int) {
        Data.tripModels.remove(at: index)
    }
    
    
}
