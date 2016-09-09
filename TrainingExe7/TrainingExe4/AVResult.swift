//
//  AVResult.swift
//  TrainingExe4
//
//  Created by ThanhNT3 on 9/6/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import Foundation
import CoreData
class AVResult : NSManagedObject{
    var date: NSDate = NSDate()
    @NSManaged var captureDate: String
    @NSManaged var avValue: Float
    @NSManaged var loviValue: Int16
    
    convenience init(captureDate: NSDate, avValue: Float, loviValue: Int16, insertIntoManagedObjectContext context: NSManagedObjectContext!){
        let entity = NSEntityDescription.entityForName("AVResult", inManagedObjectContext: context)!
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.date = captureDate
        self.captureDate = convertDateToString(captureDate)
        self.avValue = avValue
        self.loviValue = loviValue
    }
    
    func convertDateToString(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        return dateFormatter.stringFromDate(date)
    }
}
