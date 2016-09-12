//
//  InputViewController.swift
//  TrainingExe8_9
//
//  Created by ThanhNT3 on 9/12/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    @IBAction func search(sender: AnyObject) {
        if let text = tfSearchInput.text {
            self.performSegueWithIdentifier("start_search", sender: sender)
        }
    }
    @IBOutlet weak var tfSearchInput: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var desController = segue.destinationViewController as! ViewController
        desController.keyword = tfSearchInput.text
    }
    

}
