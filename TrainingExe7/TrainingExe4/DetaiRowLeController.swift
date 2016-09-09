//
//  DetaiRowLeController.swift
//  TrainingExe4
//
//  Created by ThanhNT3 on 9/7/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import UIKit

class DetaiRowLeController: UIViewController {

    @IBOutlet weak var lbDateRowLe: UILabel!
    @IBOutlet weak var lbAVRowLe: UILabel!
    @IBOutlet weak var lbLoviRowLe: UILabel!
    var data: AVResult? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        lbDateRowLe.text = "Date = " + (data!.captureDate) //dateFormatter.stringFromDate((data!.captureDate))
        lbAVRowLe.text = "AV = "+String(data!.avValue)
        lbLoviRowLe.text = "Lovo = "+String(data!.loviValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
