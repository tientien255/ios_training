//
//  DetailViewController.swift
//  TrainingExe10
//
//  Created by ThanhNT3 on 9/14/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lbTrackName: UILabel!
    @IBOutlet weak var lbArtistName: UILabel!
    @IBOutlet weak var lbCollectionName: UILabel!
    @IBOutlet weak var lbCountry: UILabel!
    
    var data: NSDictionary?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = data{
            if let trackName: String = data["trackName"] as? String {
                lbTrackName.text = "Track Name : " + trackName
            }else{
                lbTrackName.text = "Track Name : Unknown"
            }
            
            if let artistName: String = data["artistName"] as? String {
                lbArtistName.text = "Artist Name : " + artistName
            }else{
                lbArtistName.text = "Track Name : Unknown"
            }
            
            if let collectionName: String = data["collectionName"] as? String {
                lbCollectionName.text = "Collection Name : " + collectionName
            }else{
                lbCollectionName.text = "Track Name : Unknown"
            }
            
            if let country: String = data["country"] as? String {
                lbCountry.text = "Country : " + country
            }else{
                lbCountry.text = "Track Name : Unknown"
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
