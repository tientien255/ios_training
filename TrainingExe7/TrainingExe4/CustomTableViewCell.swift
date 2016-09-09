//
//  CustomTableViewCell.swift
//  TrainingExe4
//
//  Created by ThanhNT3 on 9/6/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var lbDate: UILabel!
    @IBOutlet var lbAV: UILabel!
    @IBOutlet var lbThree: UILabel!
    
    @IBOutlet var ivThumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
