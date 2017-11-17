//
//  Activity.swift
//  demoapp
//
//  Created by Morris Arroyo on 2017-11-16.
//  Copyright © 2017 Jason Sekhon. All rights reserved.
//

import UIKit

class Activity: NSObject {
    var name: String
    var type: Int
    
    init(name: String, type: Int) {
        self.name   = name
        self.type   = type
    }
}
