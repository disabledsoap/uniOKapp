//
//  StartAnalyzerViewController.swift
//  qwerty5
//
//  Created by Арсений on 03.04.2020.
//  Copyright © 2020 Арсений. All rights reserved.
//

import UIKit
class StartAnalyzerViewController: UIViewController {
    
        var ColorValue: Int = 0
    
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var KUkuView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    StartButton.layer.cornerRadius = 20
    
    KUkuView.layer.cornerRadius = 18
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SetValue(_ sender: UIButton) {
       ColorValueVC.shared.ColorValue = 0
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
