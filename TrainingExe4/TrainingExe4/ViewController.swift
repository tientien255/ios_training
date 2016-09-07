//
//  ViewController.swift
//  TrainingExe4
//
//  Created by ThanhNT3 on 9/6/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var btEdit: UIButton!
    @IBOutlet weak var btMove: UIButton!
    
    
    
    var dataArray: [AVResult] = []
    var inEditMode = false
    var inMoveMode = false
    @IBAction func clickEd(sender: AnyObject) {
        if inEditMode {
            btEdit.setTitle("Edit", forState: .Normal)
            inEditMode = false
            
        }else{
            btEdit.setTitle("Done", forState: .Normal)
            inEditMode = true
        }
    }
    
    @IBAction func clickMo(sender: AnyObject) {
        if inMoveMode {
            btMove.setTitle("Move", forState: .Normal)
            inMoveMode = false
            inEditMode = false
            mTableView.editing = false
            
        }else{
            btMove.setTitle("Done", forState: .Normal)
            inMoveMode = true
            inEditMode = true
            mTableView.editing = true
            
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initDataArray()
    }
    func initDataArray() -> Void {
        dataArray.append(AVResult(captureDate: NSDate(), avValue: 2.1, loviValue: 164))
        dataArray.append(AVResult(captureDate: NSDate(), avValue: 2.1, loviValue: 156))
        dataArray.append(AVResult(captureDate: NSDate(), avValue: 2.3, loviValue: 127))
        dataArray.append(AVResult(captureDate: NSDate(), avValue: 2.2, loviValue: 179))
        
        dataArray.append(AVResult(captureDate: NSDate(), avValue: 2.1, loviValue: 164))
        dataArray.append(AVResult(captureDate: NSDate(), avValue: 2.1, loviValue: 156))
        dataArray.append(AVResult(captureDate: NSDate(), avValue: 2.3, loviValue: 127))
        dataArray.append(AVResult(captureDate: NSDate(), avValue: 2.2, loviValue: 179))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomTableViewCell
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        cell.lbDate.text = dateFormatter.stringFromDate(dataArray[indexPath.row].captureDate)
        cell.lbAV.text = "AV " + String(dataArray[indexPath.row].avValue)
        cell.lbThree.text = "Lovi " + String(dataArray[indexPath.row].loviValue)
        cell.ivThumbnail.image = UIImage(named: "cafedeadend")
        
        return cell
    }
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return inMoveMode
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return inEditMode
    }
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .Normal, title: "Delete",handler:  { (action, indexPath) in
             self.dataArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        deleteAction.backgroundColor = UIColor.redColor()
        return [deleteAction]
        
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let temp = dataArray[sourceIndexPath.row]
        dataArray.removeAtIndex(sourceIndexPath.row)
        dataArray.insert(temp, atIndex: destinationIndexPath.row)
    }
}

