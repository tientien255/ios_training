
//
//  ViewController.swift
//  TrainingExe8_9
//
//  Created by ThanhNT3 on 9/12/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , ItunesAPIProtocol{

    @IBOutlet weak var tableView: UITableView!
    
    var keyword: String?
    var listSong: NSArray = NSArray()
    var networkManager: NetworkManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(handleResultFromNotification), name: "itunesResult", object: nil)
        
        networkManager = NetworkManager.getInstance(self)
//        networkManager!.searchItunesWithNotification(keyword!)
//        networkManager!.searchItunesWithDelegate(keyword!)
        networkManager!.searchItunesWithClosure(keyword!, applyResult: {results in
            dispatch_async(dispatch_get_main_queue(), {
                self.listSong = results
                self.tableView!.reloadData()
            })
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSong.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        let song: NSDictionary = listSong[indexPath.row] as! NSDictionary
        cell?.textLabel?.text = song["trackName"] as? String
        return cell!
    }
    
    
    func handleResultFromNotification(notification: NSNotification)  {
        let results = notification.object as! NSArray
        dispatch_async(dispatch_get_main_queue(), {
            self.listSong = results
            self.tableView!.reloadData()
        })
    }
    func didReceiveAPIResults(results: NSArray) {
        dispatch_async(dispatch_get_main_queue(), {
            self.listSong = results
            self.tableView!.reloadData()
        })
    }

    
    /*
    func iTunesSearch(term: String) {
        let urlPath: String = "https://itunes.apple.com/search?term=le&limit=4&entity=musicVideo"
        let url: NSURL = NSURL(string: urlPath)!
        let rqst: NSURLRequest = NSURLRequest(URL: url)
        let connection: NSURLConnection = NSURLConnection(request: rqst, delegate: self, startImmediately: false)!
        
        connection.start()
    }
    
    
    func connection(didReceiveResponse: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        
        self.data = NSMutableData()
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        
        self.data.appendData(data)
    }
    func connectionDidFinishLoading(connection: NSURLConnection) {
        
        
        do {
            if let jResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                if jResult.count > 0 && jResult["results"]!.count > 0 {
                    let results: NSArray = jResult["results"] as! NSArray
                    self.listSong = results
                    self.tableView.reloadData()
                }
            }
        }catch{}
    }
    */
}

