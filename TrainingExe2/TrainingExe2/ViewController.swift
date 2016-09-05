//
//  ViewController.swift
//  TrainingExe2
//
//  Created by ThanhNT3 on 9/1/16.
//  Copyright © 2016 ThanhNT3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfTen1: UITextField!
    @IBOutlet weak var tfTen2: UITextField!
    @IBOutlet weak var tfTenKana1: UITextField!
    @IBOutlet weak var tfTenKana2: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfNgaySinh: UITextField!
    @IBOutlet weak var tfSDT1: UITextField!
    @IBOutlet weak var tfSDT2: UITextField!
    @IBOutlet weak var tfSDT3: UITextField!
    @IBOutlet weak var rdNam: RadioButton!
    @IBOutlet weak var rdNu: RadioButton!
    
    @IBAction func clickNam(sender: AnyObject) {
        if (rdNam.getChecked() == false){
            rdNu.setChecked(false)
            rdNam.setChecked(true)
        }
    }
    
    @IBAction func clickNu(sender: AnyObject) {
        if (rdNu.getChecked() == false){
            rdNam.setChecked(false)
            rdNu.setChecked(true)
        }
    }
    
    @IBAction func dangKy(sender: AnyObject) {
        let ten1 = tfTen1.text!
        let ten2 = tfTen2.text!
        let tenKaNa1 = tfTenKana1.text!
        let tenKaNa2 = tfTenKana2.text!
        let email = tfEmail.text!
        let ngaySinh = tfNgaySinh.text!
        let sdt1 = tfSDT1.text!
        let sdt2 = tfSDT2.text!
        let sdt3 = tfSDT3.text!
        
        var message:String = ""
        if (ten1.characters.count == 0 || ten2.characters.count == 0 || tenKaNa1.characters.count == 0 || tenKaNa2.characters.count == 0 || email.characters.count == 0 || ngaySinh.characters.count == 0 ||          sdt1.characters.count == 0 || sdt2.characters.count == 0 || sdt3.characters.count == 0 ){
            
            message="Chua nhap du dau vao"
        }else{
            message="Dang ky thanh cong"
            
            print("Ten : \(ten1) - \(ten2)")
            print("Ten kana : \(tenKaNa1) - \(tenKaNa2)")
            print("Email : \(email)")
            print("Ngay sinh : \(ngaySinh)")
            print("Gioi tinh : \(ten1)")
            print("So dien thoai : \(sdt1) - \(sdt2) - \(sdt3)")
            
        }
        
        let alertController = UIAlertController(title: "Thong bao",message: message,preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK",style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    func textFieldDidEnd(textField: UITextField){
        if(!validate(tfEmail.text!)){
            let alertController = UIAlertController(title: "Thong bao",message: "Email sai dinh dang",preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK",style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        
        }
        
    }
    
    let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    func validate(email: String) -> Bool {
        let matches = email.rangeOfString(regex, options: .RegularExpressionSearch)
        if let _ = matches {
            return true
        }
        return false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        rdNam.setChecked(true)
        
        tfEmail.addTarget(self, action: "textFieldDidEnd:", forControlEvents: UIControlEvents.EditingDidEnd)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

