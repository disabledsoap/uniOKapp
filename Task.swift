//
//  Task.swift
//  qwerty5
//
//  Created by Арсений on 20.03.2020.
//  Copyright © 2020 Арсений. All rights reserved.
//

import UIKit
import os.log

class Task: NSObject, NSCoding {
   
    
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var start: String
    var finish: String
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("tasks")
    
    //MARK: Types
    
    struct PropertyKey {
        
        static let name = "name"
        static let photo = "photo"
        static let start = "start"
        static let finish = "finish"
        
    }
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, start: String, finish: String) {
        
       
        
        self.name = name
        self.photo = photo
        self.start = start
        self.finish = finish
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(start, forKey: PropertyKey.start)
        aCoder.encode(finish, forKey: PropertyKey.finish)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Task object.", log: OSLog.default, type: .debug)
            return nil
        }
        // Because photo is an optional property of Task, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        guard let start = aDecoder.decodeObject(forKey: PropertyKey.start) as? String else {
            os_log("Unable to decode the start for a Task object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let finish = aDecoder.decodeObject(forKey: PropertyKey.finish) as? String else {
            os_log("Unable to decode the finish for a Task object.", log: OSLog.default, type: .debug)
            return nil
        }
        // Must call designated initializer.
        self.init(name: name, photo: photo, start: start, finish: finish)
    }
    
}
