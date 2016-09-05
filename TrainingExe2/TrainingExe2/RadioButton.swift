//
//  RadioButton.swift
//  TrainingExe2
//
//  Created by ThanhNT3 on 9/1/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import UIKit

class RadioButton: UIButton {

    let checkedImage = UIImage(named: "checked")! as UIImage
    let unCheckedImage = UIImage(named: "unchecked")! as UIImage
    
    var isChecked: Bool = false{
        didSet{
            if isChecked == true{
                self.setImage(checkedImage, forState: .Normal)
            }else{
                self.setImage(unCheckedImage, forState: .Normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: "buttonOnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = false;
    }
    func setChecked(c:Bool){
        self.isChecked=c;
    }
    func getChecked() ->  Bool {
        return isChecked;
    }
    func buttonOnClick(sender:UIButton){
        if (sender == self){
            if (isChecked == true){
                //isChecked = false
            }else{
                //isChecked = true
            }
        }
    }
}
