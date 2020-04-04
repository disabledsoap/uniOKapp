//
//  CalmDViewController.swift
//  qwerty5
//
//  Created by Арсений on 03.04.2020.
//  Copyright © 2020 Арсений. All rights reserved.
//

import UIKit

class CalmDViewController: UIViewController {

    @IBOutlet weak var definition1: UILabel!
    @IBOutlet weak var definition2: UILabel!
    @IBOutlet weak var definition3: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ToTheIdk(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ToTheHappy(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(leftSwipe)
        
        let Advicepush = UILongPressGestureRecognizer(target: self, action: #selector(ToTheCalmAdvice(longpress:)))
        self.view.addGestureRecognizer(Advicepush)
        
        definition1.layer.cornerRadius = 13
        definition1.layer.masksToBounds = true
        
        definition2.layer.cornerRadius = 13
        definition2.layer.masksToBounds = true
        
        definition3.layer.cornerRadius = 13
        definition3.layer.masksToBounds = true
        
        
        // Do any additional setup after loading the view.
    }
    @objc func ToTheIdk(swipe:UISwipeGestureRecognizer){
        performSegue(withIdentifier: "CalmtoIdk", sender: self)
    }
    @objc func ToTheHappy(swipe:UISwipeGestureRecognizer){
        performSegue(withIdentifier: "CalmtoHappy", sender: self)
    }
    @objc func ToTheCalmAdvice(longpress:UILongPressGestureRecognizer){
        performSegue(withIdentifier: "Calmpush", sender: self)
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
