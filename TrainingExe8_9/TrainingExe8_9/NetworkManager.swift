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
    
    var delegate: ItunesAPIProtocol?
    
    class func getInstance(delegate: ItunesAPIProtocol) -> NetworkManager {
        struct Static {
            static var instance: NetworkManager?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = NetworkManager(delegate: delegate)
        }
        return Static.instance!
    }
    
    
    
    private init(delegate : ItunesAPIProtocol){
        self.delegate = delegate
    }
    
    func searchItunesWithDelegate(searchTerm: String) {
        let itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
    
        if let escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) {
            let urlPath = "http://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"
            let url: NSURL = NSURL(string: urlPath)!
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
                do{
                    if let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                    
                    let results: NSArray = jsonResult["results"] as! NSArray
                    
                    self.delegate?.didReceiveAPIResults(results)
                    
                    }
                }catch{}
            
            })
            task.resume()
        }
    }
    func searchItunesWithNotification(searchTerm: String) {
        let itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
        if let escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) {
            let urlPath = "http://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"
            let url: NSURL = NSURL(string: urlPath)!
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
                do{
                    if let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                        
                        let results: NSArray = jsonResult["results"] as! NSArray
                        
                        NSNotificationCenter.defaultCenter().postNotificationName("itunesResult", object: results)
                    }
                }catch{}
                
            })
            task.resume()
        }
    }
    func searchItunesWithClosure(searchTerm: String, applyResult: NSArray -> Void) {
        let itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
        if let escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) {
            let urlPath = "http://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"
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
