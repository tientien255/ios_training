//
//  PageItemViewController.swift
//  TrainingExe10
//
//  Created by ThanhNT3 on 9/13/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import UIKit

class PageItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    var keyword: String?
    var mediaType: String?
    var listSong: NSArray = NSArray()
    var dataSelected: NSDictionary?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.getInstance().searchItunesWithClosure(keyword!,mediaType: mediaType!, applyResult: {results in
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
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCellWithIdentifier("cell",forIndexPath:  indexPath) as! CustomTableViewCell
        let song: NSDictionary = listSong[indexPath.row] as! NSDictionary
        
        if let trackName = song["trackName"] as? String{
            cell.lbTrackName.text = trackName
        }else{
            cell.lbTrackName.text = "Unknown"
        }
        
        if let artistName = song["artistName"] as? String{
            cell.lbArtistName.text = artistName
        }else{
            cell.lbArtistName.text = "Unknown"
        }
        cell.ivThumbnail.image = UIImage(named: "ic_unknown.png")
        
        let urlThumb = song["artworkUrl60"] as! String
        if let nsURL: NSURL = NSURL(string: urlThumb) {
            let request = NSURLRequest(URL: nsURL)
            let mainQueue = NSOperationQueue.mainQueue()
            NSURLConnection.sendAsynchronousRequest(request, queue: mainQueue, completionHandler:{ (respond,data,error) ->Void in
                if error == nil{
                    let image = UIImage(data: data!)
                    dispatch_async(dispatch_get_main_queue(), {
                        if let cellToUpdate: CustomTableViewCell = tableView.cellForRowAtIndexPath(indexPath) as? CustomTableViewCell{
                            cellToUpdate.ivThumbnail.image = image
                        }
                    })
                }
                })
 

        }else{
            
        }
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let data: NSDictionary = listSong[indexPath.row] as! NSDictionary{
            dataSelected = data
            performSegueWithIdentifier("view_detail", sender: tableView)
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let desController: DetailViewController = segue.destinationViewController as! DetailViewController
        desController.data = dataSelected!
        
    }
    
}
