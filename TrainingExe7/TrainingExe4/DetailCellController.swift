//
//  DetailCellController.swift
//  TrainingExe4
//
//  Created by ThanhNT3 on 9/7/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import UIKit

class DetailCellController: UIViewController {
    
    @IBOutlet weak var lbDateDetail: UILabel!
    @IBOutlet weak var lbAVDetail: UILabel!
    @IBOutlet weak var lbLoviDetail: UILabel!
    
    var data: AVResult? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        lbDateDetail.text = "Date = " + (data!.captureDate) //dateFormatter.stringFromDate((data!.captureDate))
        lbAVDetail.text = "AV = "+String(data!.avValue)
        lbLoviDetail.text = "Lovo = "+String(data!.loviValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
