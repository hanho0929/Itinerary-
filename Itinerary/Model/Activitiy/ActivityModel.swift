//
//  ActivityModel.swift
//  Itinerary
//
//  Created by hanho on 3/13/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import Foundation
import UIKit

struct ActivityModel {
    var id: UUID
    var title = ""
    var subTitle = ""
    var activityType: ActivityType
    var photo: UIImage?
    
    init(title: String, subTitle: String, activityType: ActivityType, photo: UIImage? = nil) {
        id = UUID()
        self.title = title
        self.subTitle = subTitle
        self.activityType = activityType
        self.photo = photo
    }
}
