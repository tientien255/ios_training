//
//  FlipFlapModel.swift
//  TrainingExe6
//
//  Created by ThanhNT3 on 9/7/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import Foundation

class FlipFlapModel {
    static let GIRAFFE = 1
    static let CHICKEN = 2
    static let SNACK = 3
    static let CHEETAH = 4
    static let MONKEY = 5
    static let BEAR = 6
    
    static let DEFAULT = 1
    static let OPEN = 2
    static let HIDE = 3
    
    var index: Int
    var imageName: String
    var type: Int
    var status: Int
    init(index: Int, status: Int, type: Int, imageName: String){
        self.index = index
        self.imageName = imageName
        self.type = type
        self.status = status
    }
    func getStatus() -> Int {
        return status
    }
    func setStatus(status: Int) -> Void {
        self.status = status
    }
    func getIndex() -> Int {
        return index
    }
    func getImage() -> String {
        if status == 2 {
            return imageName
        }else if status == 3{
            return "ic_backside.jpg"
        }else{
            return "ic_backside.jpg"
        }
    }
}