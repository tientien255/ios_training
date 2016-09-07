//
//  AVResult.swift
//  TrainingExe4
//
//  Created by ThanhNT3 on 9/6/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import Foundation
class AVResult{
    var captureDate: NSDate
    var avValue: Float
    var loviValue: Int
    
    init(captureDate: NSDate, avValue: Float, loviValue: Int){
        self.captureDate = captureDate
        self.avValue = avValue
        self.loviValue = loviValue
    }
}
