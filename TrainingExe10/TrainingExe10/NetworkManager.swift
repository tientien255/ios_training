//
//  NetworkManager.swift
//  TrainingExe8_9
//
//  Created by ThanhNT3 on 9/12/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import Foundation

protocol ItunesAPIProtocol {
    func didReceiveAPIResults(results: NSArray)
}

class NetworkManager {
    
    
    
    class func getInstance() -> NetworkManager {
        struct Static {
            static var instance: NetworkManager?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = NetworkManager()
        }
        return Static.instance!
    }
    
    
    
    private init(){
        
    }
    
    
    func searchItunesWithClosure(searchTerm: String,mediaType: String, applyResult: NSArray -> Void) {
        let itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
        if let escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) {
            let urlPath = "http://itunes.apple.com/search?term=\(escapedSearchTerm)&media="+mediaType
            let url: NSURL = NSURL(string: urlPath)!
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
                do{
                    if let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                        
                        let results: NSArray = jsonResult["results"] as! NSArray
                        applyResult(results)
                    }
                }catch{}
                
            })
            task.resume()
        }
    }

}
