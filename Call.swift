//
//  Call.swift
//  qwerty5
//
//  Created by Арсений on 26.03.2020.
//  Copyright © 2020 Арсений. All rights reserved.
//

import UIKit

class Call: UIViewController {

    @IBOutlet weak var CallMomButton: UIButton!
    @IBOutlet weak var CallDadbutton: UIButton!
    @IBOutlet weak var CallDoctorButton: UIButton!

    var Momnumber: String = ""
    var Dadnumber: String = ""
    var Doctornumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       CallMomButton.layer.cornerRadius = CallMomButton.frame.size.width / 2
       CallMomButton.clipsToBounds = true

        CallDadbutton.layer.cornerRadius = CallDadbutton.frame.size.width / 2
        CallDadbutton.clipsToBounds = true

        CallDoctorButton.layer.cornerRadius = CallDoctorButton.frame.size.width / 2
        CallDoctorButton.clipsToBounds = true
        // Do any additional setup after loading the view.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.Call_VC = self
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
    
    
    @IBAction func CallMom(_ sender: UIButton) {
        guard let numberMom = URL(string: "tel://" + Momnumber) else { return }
        UIApplication.shared.open(numberMom)
    }
    
    @IBAction func CallDad(_ sender: UIButton) {
        guard let numberDad = URL(string: "tel://" + Dadnumber) else { return }
        UIApplication.shared.open(numberDad)
    }
    
    @IBAction func CallDoctor(_ sender: UIButton) {
        guard let numberDoctor = URL(string: "tel://" + Doctornumber) else { return }
        UIApplication.shared.open(numberDoctor)
    }
    
    
    
    
    
    
    
    
    
    }









    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


