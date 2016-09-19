//
//  ViewController.swift
//  TrainingExe10
//
//  Created by ThanhNT3 on 9/13/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var titles = ["Music Video","Movie","Ebook","Audio Book","Podcast"]
    var mediaTypes = ["musicVideo","movie","ebook","audiobook","podcast"]
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        edgesForExtendedLayout = UIRectEdge.None
        
        
        let options = ViewPagerOptions(inView: self.view)
        options.isEachTabEvenlyDistributed = true
        options.isTabViewHighlightAvailable = true
        options.tabViewBackgroundDefaultColor = UIColor(red: CGFloat(215.0/255.0), green: CGFloat(215.0/255), blue: CGFloat(215.0/255), alpha: 1.0)
        options.tabViewBackgroundHighlightColor = UIColor(red: CGFloat(229.0/255.0), green: CGFloat(70.0/255.0), blue: CGFloat(70.0/255.0), alpha: 1.0)
        options.tabViewTextDefaultColor = UIColor(red: CGFloat(40.0/255.0), green: CGFloat(40.0/255.0), blue: CGFloat(40.0/255.0), alpha: 1.0)
        options.tabViewTextHighlightColor = UIColor.whiteColor()
        options.isTabIndicatorViewAvailable = false
        options.fitAllTabsInView = false
        
        let viewPager = ViewPagerController()
        viewPager.options = options
        viewPager.dataSource = self
        viewPager.delegate = self
        
        self.addChildViewController(viewPager)
        self.view.addSubview(viewPager.view)
        viewPager.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

extension MainViewController: ViewPagerControllerDataSource
{
    
    func numberOfPages() -> Int
    {
        return titles.count
    }
    
    func viewControllerAtPosition(position:Int) -> UIViewController
    {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("PageItemViewController") as! PageItemViewController
        vc.keyword = "le"
        vc.mediaType = mediaTypes[position]
        return vc
    }
    
    func pageTitles() -> [String]
    {
        return titles
    }
    
}

extension MainViewController: ViewPagerControllerDelegate
{
    func willMoveToViewControllerAtIndex(index:Int)
    {
        
    }
    
    func didMoveToViewControllerAtIndex(index:Int)
    {
        
    }
    
    
    
}