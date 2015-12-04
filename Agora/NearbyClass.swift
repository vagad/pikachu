//
//  NearbyClass.swift
//  
//
//  Created by Vamsi Gadiraju on 10/23/15.
//
//

import Foundation
import UIKit

class NearbyClass: PFTableViewCell {
    // MARK: Properties
    
    var className: String
    var buildingName: String
    var profName: String
    var timeAndDay: String
    
    // MARK: Initialization
    
    init?(className: String, buildingName: String, profName: String, timeAndDay: String) {
        // Initialize stored properties.
        self.className = className
        self.buildingName = buildingName
        self.profName = profName
        self.timeAndDay = timeAndDay
        
        // Initialization should fail if there is no name or if the rating is negative.
        if className.isEmpty || buildingName.isEmpty || profName.isEmpty || timeAndDay.isEmpty{
            return nil
        }
    }
    
}