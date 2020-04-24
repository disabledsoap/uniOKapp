//
//  AngryDViewController.swift
//  qwerty5
//
//  Created by Арсений on 03.04.2020.
//  Copyright © 2020 Арсений. All rights reserved.
//

import UIKit

class AngryDViewController: UIViewController {
    
    @IBOutlet weak var definition1: UILabel!
    @IBOutlet weak var definition2: UILabel!
    @IBOutlet weak var definition3: UILabel!
    
    @IBOutlet weak var AngryPic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      AngryPic.layer.cornerRadius = 28
        
        let Advicepush = UILongPressGestureRecognizer(target: self, action: #selector(ToTheAngryAdvice(longpress:)))
        self.view.addGestureRecognizer(Advicepush)
        
        definition1.layer.cornerRadius = 13
        definition1.layer.masksToBounds = true
        
        definition2.layer.cornerRadius = 13
        definition2.layer.masksToBounds = true
        
        definition3.layer.cornerRadius = 13
        definition3.layer.masksToBounds = true
        
        // Do any additional setup after loading the view.
  }
    
    @objc func ToTheAngryAdvice(longpress:UILongPressGestureRecognizer){
        performSegue(withIdentifier: "Angrypush", sender: self)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
