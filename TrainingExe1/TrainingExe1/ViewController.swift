//
//  ViewController.swift
//  TrainingExe1
//
//  Created by ThanhNT3 on 8/31/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello World\n\n")
        
        var stars: String = ""
        for i in 0...11 {
            if i == 0 || i == 11{
                stars = stars + "***************\n"
            }else{
                stars = stars + "*             *\n"
            }
        }
        print(stars)
        
        var mang:[String] = ["a","b","c"]
        print("Mang truoc khi them")
        for item in mang {
            print(item)
        }
        mang.append("d")
        print("mang sau khi them")
        for (index,value) in mang.enumerate(){
            print("Index : \(index) --- Value : \(value)")
        }
        
        
        var dictionary = [String:String]()
        dictionary["ten"] = "ThanhNT"
        dictionary["tuoi"] = "24"
        dictionary["diachi"] = "HaNoi"
        dictionary["sodienthoai"] = "012345678"
        print("Ten nguoi dung : \(dictionary["ten"]!)")
        
        
        var mangDic = [Dictionary<String,String>]()
        var nguoi1 = [String:String]()
        nguoi1["ten"] = "A"
        nguoi1["tuoi"] = "24"
        nguoi1["diachi"] = "HaNoi"
        nguoi1["sodienthoai"] = "012345678"
        
        var nguoi2 = [String:String]()
        nguoi2["ten"] = "B"
        nguoi2["tuoi"] = "20"
        nguoi2["diachi"] = "HaNoi"
        nguoi2["sodienthoai"] = "012345678"
        
        var nguoi3 = [String:String]()
        nguoi3["ten"] = "C"
        nguoi3["tuoi"] = "26"
        nguoi3["diachi"] = "HaNoi"
        nguoi3["sodienthoai"] = "012345678"
        
        mangDic.append(nguoi1)
        mangDic.append(nguoi2)
        mangDic.append(nguoi3)
        
        //for user in mangDic {
        //    print("tuoi ==== %d", String.toInt(user["tuoi"]!))
        //}
        
        for i in 0..<mangDic.count {
            for j in (i+1)..<mangDic.count {
                var nguoiI = mangDic[i]
                var nguoiJ = mangDic[j]
                
                
                
                var tuoiNguoiI = Int(nguoiI["tuoi"]!)
                var tuoiNguoiJ = Int(nguoiJ["tuoi"]!)
                
                if tuoiNguoiI > tuoiNguoiJ{
                    mangDic[i] = nguoiJ
                    mangDic[j] = nguoiI
                }
 
            }
            print("Ten : "+mangDic[i]["ten"]!)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

