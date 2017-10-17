//
//  ExtenedUserDefaults.swift
//  UserDefaults
//
//  Created by Matthealicorn on 2017-03-25.
//  Copyright © 2017 Time Capsule. All rights reserved.
//

/// Support UIColor

import UIKit

extension UserDefaults {
    func set(color: UIColor?, key: String) {
        var colorData: Data?
        
        if let color = color {
            colorData = NSKeyedArchiver.archivedData(withRootObject: color) as Data?
        }
        
        set(colorData, forKey: key)
    }
    
    func colorForKey(key: String) -> UIColor? {
        var color: UIColor?
        
        if let colorData = data(forKey: key) {
            color = NSKeyedUnarchiver.unarchiveObject(with: colorData) as? UIColor
        }
        
        return color
    }
}
