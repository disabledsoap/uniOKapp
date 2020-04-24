//
//  EditCallViewController.swift
//  qwerty5
//
//  Created by Арсений on 26.03.2020.
//  Copyright © 2020 Арсений. All rights reserved.
//
import os.log

import UIKit

class EditCallViewController: UIViewController {

    var call: Call?
    
    let defaults = UserDefaults.standard
    
    struct Keys {
        static let momTextField      = "momTextField"
        static let dadTextField      = "dadTextField"
        static let doctorTextField   = "doctorTextField"
        static let locationTextField = "locationTextField"
    }
   
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var momTextField: UITextField!
    @IBOutlet weak var dadTextField: UITextField!
    @IBOutlet weak var doctorTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        momTextField.keyboardType    = UIKeyboardType.numberPad
        dadTextField.keyboardType    = UIKeyboardType.numberPad
        doctorTextField.keyboardType = UIKeyboardType.numberPad
        
        momTextField.layer.cornerRadius = 18
        dadTextField.layer.cornerRadius = 18
        doctorTextField.layer.cornerRadius = 18
        locationTextField.layer.cornerRadius = 18
        
        checkForSavedNumbers()
        // Do any additional setup after loading the view.
    }
    
  
    

    @IBAction func Done(_ sender: UIBarButtonItem) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.Call_VC?.Momnumber    = momTextField.text!
        appDelegate.Call_VC?.Dadnumber    = dadTextField.text!
        appDelegate.Call_VC?.Doctornumber = doctorTextField.text!
        
        LocationVC.sharedd.location = locationTextField.text
        
        saveNumbers()
        
        navigationController?.popViewController(animated: true)
    }
    
    func saveNumbers() {
        defaults.set(momTextField.text!,      forKey: Keys.momTextField)
        defaults.set(dadTextField.text!,      forKey: Keys.dadTextField)
        defaults.set(doctorTextField.text!,   forKey: Keys.doctorTextField)
        defaults.set(locationTextField.text!, forKey: Keys.locationTextField)
    }
    
    func checkForSavedNumbers(){
        
         let momnumber    = defaults.value(forKey: Keys.momTextField)    as? String ?? ""
         let dadnumber    = defaults.value(forKey: Keys.dadTextField)    as? String ?? ""
         let doctornumber = defaults.value(forKey: Keys.doctorTextField) as? String ?? ""
         let locationtext = defaults.value(forKey: Keys.locationTextField) as? String ?? ""
        
        
        momTextField.text      = momnumber
        dadTextField.text      = dadnumber
        doctorTextField.text   = doctornumber
        locationTextField.text = locationtext
    }
    

}
