//
//  CalmFViewController.swift
//  qwerty5
//
//  Created by Арсений on 07.04.2020.
//  Copyright © 2020 Арсений. All rights reserved.
//

import UIKit

class CalmFViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var FinishButton: UIButton!
    @IBOutlet weak var CalmFPic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   FinishButton.layer.cornerRadius = 18
        // Do any additional setup after loading the view.
    }
    
    @IBAction func FinishCalm(_ sender: Any) {
        
      
        
        
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: StartAnalyzerViewController.self) {
                _ =  self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    ColorValueVC.shared.ColorValue = 6
       

    }
    
   
}

/*extension CalmFViewController: UICollectionViewDelegate{
    
}
*/
