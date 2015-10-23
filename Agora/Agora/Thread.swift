//
//  Thread.swift
//  Agora
//
//  Created by Vamsi Gadiraju on 10/23/15.
//  Copyright (c) 2015 ADI_Lab. All rights reserved.
//

import Foundation
import UIKit

class Thread {
    // MARK: Properties
    
    var subject: String
    var comment: String
    var rating: Int
    
    // MARK: Initialization
    
    init?(subject: String, comment: String, rating: Int) {
        // Initialize stored properties.
        self.subject = subject
        self.comment = comment
        self.rating = rating
        
        // Initialization should fail if there is no name or if the rating is negative.
        if subject.isEmpty || rating < -5 || comment.isEmpty {
            return nil
        }
    }
    
}