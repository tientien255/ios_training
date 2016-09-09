//
//  ViewController.swift
//  TrainingExe4
//
//  Created by ThanhNT3 on 9/6/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate{
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var btEdit: UIButton!
    @IBOutlet weak var btMove: UIButton!
    
    
    var fetchResultController:NSFetchedResultsController!
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

    @IBAction func clickBack(sender: AnyObject) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataArray()
    }
    func initDataArray() -> Void {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "AVResult")
        let sortDescriptor = NSSortDescriptor(key: "loviValue", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        do {
            try fetchResultController.performFetch()
            let results = fetchResultController.fetchedObjects
            dataArray = results as! [AVResult]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
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
    func deleteInCoreDate(indexPath: NSIndexPath) -> Void {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        managedContext.deleteObject(self.fetchResultController.objectAtIndexPath(indexPath) as! AVResult)
        do{
            try managedContext.save()
            print(String(indexPath.row))
        }catch{
            print(error)
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: CustomTableViewCell
        if indexPath.row % 2 == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier("cellLe", forIndexPath: indexPath) as! CustomTableViewCell
        }else{
            cell = tableView.dequeueReusableCellWithIdentifier("cellChan", forIndexPath: indexPath) as! CustomTableViewCell
        }
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        cell.lbDate.text = dataArray[indexPath.row].captureDate //dateFormatter.stringFromDate(dataArray[indexPath.row].captureDate)
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
//            self.dataArray.removeAtIndex(indexPath.row)
            self.deleteInCoreDate(indexPath)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//            tableView.reloadData()
        })
        deleteAction.backgroundColor = UIColor.redColor()
        return [deleteAction]
        
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let temp = dataArray[sourceIndexPath.row]
        dataArray.removeAtIndex(sourceIndexPath.row)
        dataArray.insert(temp, atIndex: destinationIndexPath.row)
        tableView.reloadData()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSegue" {
            if let indexPath = mTableView.indexPathForSelectedRow {
                let desController = segue.destinationViewController as! DetailCellController
                desController.data = dataArray[indexPath.row]
            }
        }else if segue.identifier == "showPresent" {
            if let indexPath = mTableView.indexPathForSelectedRow {
                let desController = segue.destinationViewController as! DetaiRowLeController
                desController.data = dataArray[indexPath.row]
            }
        }
    }
    
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        mTableView.beginUpdates()
    }
    func controller(controller: NSFetchedResultsController, didChangeObject
        anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type:
        NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            if let _newIndexPath = newIndexPath {
                mTableView.insertRowsAtIndexPaths([_newIndexPath], withRowAnimation:.Fade)
            }
        case .Delete:
            if let _indexPath = indexPath {
                mTableView.deleteRowsAtIndexPaths([_indexPath], withRowAnimation:.Fade)
            }
        case .Update:
            if let _indexPath = indexPath {
                mTableView.reloadRowsAtIndexPaths([_indexPath], withRowAnimation: .Fade)
            }
        default:
            mTableView.reloadData()
        }
        dataArray = controller.fetchedObjects as! [AVResult]
    }
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        mTableView.endUpdates()
    }
}

