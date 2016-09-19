//
//  AboutViewController.swift
//  TrainingExe10
//
//  Created by ThanhNT3 on 9/14/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var ibMenu: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            ibMenu.target = self.revealViewController()
            ibMenu.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
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
