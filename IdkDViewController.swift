//
//  IdkDViewController.swift
//  qwerty5
//
//  Created by Арсений on 03.04.2020.
//  Copyright © 2020 Арсений. All rights reserved.
//

import UIKit

class IdkDViewController: UIViewController {

    @IBOutlet weak var bad: UIButton!
    @IBOutlet weak var good: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    bad.layer.cornerRadius = bad.frame.size.width / 2
    bad.clipsToBounds = true
        
    good.layer.cornerRadius = good.frame.size.width / 2
    good.clipsToBounds = true
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func IdktoCalm(_ sender: UIButton) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: CalmDViewController.self) {
                _ =  self.navigationController!.pushViewController(controller, animated: true)
                break
            }
        }
    }
    
   
}



