//
//  AddAVResultController.swift
//  TrainingExe4
//
//  Created by ThanhNT3 on 9/9/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import UIKit
import CoreData
class AddAVResultController: UIViewController {

    @IBOutlet weak var tfAVValue: UITextField!
    @IBOutlet weak var tfLoviValue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func clickAdd(sender: AnyObject) {

        if let avValue = Float(tfAVValue.text!), let lvValue = Int16(tfLoviValue.text!){
            if let managedObjectContext = (UIApplication.sharedApplication().delegate as?AppDelegate)?.managedObjectContext{
                AVResult(captureDate: NSDate(), avValue: avValue, loviValue: lvValue, insertIntoManagedObjectContext: managedObjectContext)
                
                do {
                    try managedObjectContext.save()
                    self.performSegueWithIdentifier("segueAdd", sender: sender)
                } catch {
                    print(error)
                    return
                }
            }
        }else{
            let alertError = UIAlertController(title: "", message: "Input invalid", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alertError.addAction(okAction)
            self.presentViewController(alertError, animated: true, completion: nil)
        }

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
}
