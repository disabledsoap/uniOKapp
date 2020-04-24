//
//  AnxietyFViewController.swift
//  qwerty5
//
//  Created by Арсений on 04.04.2020.
//  Copyright © 2020 Арсений. All rights reserved.
//

import UIKit

class AnxietyFViewController: UIViewController {

    @IBOutlet weak var FinishButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    FinishButton.layer.cornerRadius = 28
        // Do any additional setup after loading the view.
    }
    
    @IBAction func FinishAnxiety(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: StartAnalyzerViewController.self) {
                _ =  self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
      ColorValueVC.shared.ColorValue = 2
        let CalendarVC = CalendarViewController()
       

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
