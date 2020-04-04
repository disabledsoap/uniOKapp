//
//  AnxietyFViewController.swift
//  qwerty5
//
//  Created by Арсений on 04.04.2020.
//  Copyright © 2020 Арсений. All rights reserved.
//

import UIKit

class AnxietyFViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func FinishAnxiety(_ sender: UIButton) {
        performSegue(withIdentifier: "ToMainScreen", sender: UIButton.self)
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
