//
//  ViewController.swift
//  TrainingExe6
//
//  Created by ThanhNT3 on 9/7/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate {
    @IBOutlet weak var lbTime: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var arrFlipModel:[FlipFlapModel] = []
    var timer: NSTimer!
    var currentTimeSeconds = 0
    var dem = 0
    var posSelect1: Int = -1
    var posSelect2: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.increaseTime), userInfo: nil, repeats: true)
        
        
    }
    func increaseTime() -> Void {
        currentTimeSeconds += 1
        lbTime.text = "Time : "+String(currentTimeSeconds) + " seconds"
    }
    func initData (){
        arrFlipModel.append(FlipFlapModel(index: 0, status: FlipFlapModel.DEFAULT ,type: FlipFlapModel.GIRAFFE , imageName: "giraffe.jpg"))
        arrFlipModel.append(FlipFlapModel(index: 1, status: FlipFlapModel.DEFAULT, type: FlipFlapModel.SNACK ,imageName: "snack.jpg"))
        arrFlipModel.append(FlipFlapModel(index: 2, status: FlipFlapModel.DEFAULT, type: FlipFlapModel.CHICKEN ,imageName: "chicken.jpg"))
        arrFlipModel.append(FlipFlapModel(index: 3, status: FlipFlapModel.DEFAULT, type: FlipFlapModel.MONKEY ,imageName: "monkey.jpg"))
        arrFlipModel.append(FlipFlapModel(index: 4, status: FlipFlapModel.DEFAULT, type: FlipFlapModel.CHEETAH ,imageName: "cheetah.jpg"))
        arrFlipModel.append(FlipFlapModel(index: 5, status: FlipFlapModel.DEFAULT, type: FlipFlapModel.BEAR ,imageName: "bear.jpg"))
        arrFlipModel.append(FlipFlapModel(index: 6, status: FlipFlapModel.DEFAULT, type: FlipFlapModel.CHICKEN ,imageName: "chicken.jpg"))
        arrFlipModel.append(FlipFlapModel(index: 7, status: FlipFlapModel.DEFAULT, type: FlipFlapModel.GIRAFFE ,imageName: "giraffe.jpg"))
        arrFlipModel.append(FlipFlapModel(index: 8, status: FlipFlapModel.DEFAULT, type: FlipFlapModel.BEAR ,imageName: "bear.jpg"))
        arrFlipModel.append(FlipFlapModel(index: 9, status: FlipFlapModel.DEFAULT, type: FlipFlapModel.SNACK ,imageName: "snack.jpg"))
        arrFlipModel.append(FlipFlapModel(index: 10, status: FlipFlapModel.DEFAULT, type: FlipFlapModel.CHEETAH ,imageName: "cheetah.jpg"))
        arrFlipModel.append(FlipFlapModel(index: 11, status: FlipFlapModel.DEFAULT, type: FlipFlapModel.MONKEY ,imageName: "monkey.jpg"))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrFlipModel.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collection_cell", forIndexPath: indexPath) as! FilpFlapCell
        
        cell.ivFlipFlap.image = UIImage(named: (arrFlipModel[indexPath.section*3+indexPath.row]).getImage())
        
        let alpha: CGFloat
        if (arrFlipModel[indexPath.section*3 + indexPath.row]).getStatus() == FlipFlapModel.HIDE {
            alpha = 0
        }else{
            alpha = 1
        }
        cell.ivFlipFlap.alpha = alpha
       
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipe(_:)) )
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipe(_:)) )
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipe(_:)) )
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipe(_:)) )
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap(_:)))
       
        
        cell.addGestureRecognizer(swipeLeft)
        cell.addGestureRecognizer(swipeRight)
        cell.addGestureRecognizer(swipeUp)
        cell.addGestureRecognizer(swipeDown)
        cell.addGestureRecognizer(tap)
        
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func handleTap(gestureRecognizer : UITapGestureRecognizer){
        
        let cell = gestureRecognizer.view as! FilpFlapCell
        
        if let indexPath : NSIndexPath = (self.collectionView?.indexPathForCell(cell))!{
            
                if (arrFlipModel[indexPath.section*3 + indexPath.row]).getStatus() == FlipFlapModel.DEFAULT {
                    let cell = collectionView.cellForItemAtIndexPath(indexPath) as! FilpFlapCell

                    if dem == 0 {
                        UIView.transitionWithView(cell, duration: 0.5, options: .TransitionFlipFromLeft, animations: {}, completion:{_ in
                            (self.arrFlipModel[indexPath.section*3 + indexPath.row]).setStatus(FlipFlapModel.OPEN)
                            self.dem += 1
                            self.posSelect1 = indexPath.section*3 + indexPath.row
                            self.collectionView.reloadData()
                        })
                    }else if dem == 1 {
                        UIView.transitionWithView(cell, duration: 0.5, options: .TransitionFlipFromLeft, animations: {}, completion:{_ in
                            (self.arrFlipModel[indexPath.section*3 + indexPath.row]).setStatus(FlipFlapModel.OPEN)
                            self.dem += 1
                            self.posSelect2 = indexPath.section*3 + indexPath.row
                            self.collectionView.reloadData()
                            NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.matching), userInfo: nil, repeats: false)
                        })
                    }
                }
            }
    }
    func handleSwipe(gestureRecognizer : UISwipeGestureRecognizer){
        
        let cell = gestureRecognizer.view as! FilpFlapCell
        
        if let indexPath : NSIndexPath = (self.collectionView?.indexPathForCell(cell))!{
            
            if (arrFlipModel[indexPath.section*3 + indexPath.row]).getStatus() == FlipFlapModel.DEFAULT {
                if dem == 0 {
                    UIView.transitionWithView(cell, duration: 0.5, options: .TransitionFlipFromLeft, animations: {}, completion:{_ in
                            (self.arrFlipModel[indexPath.section*3 + indexPath.row]).setStatus(FlipFlapModel.OPEN)
                            self.dem += 1
                            self.posSelect1 = indexPath.section*3 + indexPath.row
                            self.collectionView.reloadData()
                            })
                }else if dem == 1 {
                    UIView.transitionWithView(cell, duration: 0.5, options: .TransitionFlipFromLeft, animations: {}, completion:{_ in
                        (self.arrFlipModel[indexPath.section*3 + indexPath.row]).setStatus(FlipFlapModel.OPEN)
                        self.dem += 1
                        self.posSelect2 = indexPath.section*3 + indexPath.row
                        self.collectionView.reloadData()
                        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.matching), userInfo: nil, repeats: false)
                    })
                }
            }
        }
        
        
    }

    func matching() -> Void {
        if (arrFlipModel[posSelect1]).type == (arrFlipModel[posSelect2]).type {
            (arrFlipModel[posSelect1]).setStatus(FlipFlapModel.HIDE)
            (arrFlipModel[posSelect2]).setStatus(FlipFlapModel.HIDE)
            posSelect1 = -1
            posSelect2 = -1
            dem = 0
            collectionView.reloadData()
            if isGameOver() {
                timer.invalidate()
                
                let alert = UIAlertController(title: "", message: "You win in " + String(currentTimeSeconds), preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Good", style: .Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            
        }else{
            (arrFlipModel[posSelect1]).setStatus(FlipFlapModel.DEFAULT)
            (arrFlipModel[posSelect2]).setStatus(FlipFlapModel.DEFAULT)
            posSelect1 = -1
            posSelect2 = -1
            dem = 0
            collectionView.reloadData()
        }

    }
    func isGameOver() -> Bool {
        for x in arrFlipModel{
            if x.getStatus() == FlipFlapModel.DEFAULT{
                return false
            }
        }
        return true
    }
}

