//
//  DateExtension.swift
//  Itinerary
//
//  Created by hanho on 3/21/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import Foundation



extension Date {
    func add(days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: Date())!
    }
}
