//
//  ChooseImageViewController.swift
//  qwerty5
//
//  Created by Арсений on 19.03.2020.
//  Copyright © 2020 Арсений. All rights reserved.
//

import UIKit

class ChooseImageViewController: UIViewController {

    @IBOutlet weak var image1: UIButton!
    @IBOutlet weak var image2: UIButton!
    @IBOutlet weak var image3: UIButton!
    @IBOutlet weak var image4: UIButton!
    @IBOutlet weak var image5: UIButton!
    @IBOutlet weak var image6: UIButton!
    @IBOutlet weak var image7: UIButton!
    @IBOutlet weak var image8: UIButton!
    
 override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func image2Choosed(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.TaskEditor_VC?.photoImageView.image = UIImage(named: "BrushingTeeth-1")
         navigationController?.popViewController(animated: true)
    }
    
    @IBAction func image1Choosed(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.TaskEditor_VC?.photoImageView.image = UIImage(named: "Reading")
         navigationController?.popViewController(animated: true)
    }
    
    @IBAction func image3Choosed(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.TaskEditor_VC?.photoImageView.image = UIImage(named: "Sleep2")
         navigationController?.popViewController(animated: true)
    }
    
    @IBAction func image4Choosed(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.TaskEditor_VC?.photoImageView.image = UIImage(named: "Basketball")
         navigationController?.popViewController(animated: true)
    }
    
    @IBAction func image5Choosed(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.TaskEditor_VC?.photoImageView.image = UIImage(named: "Lemonade-1")
         navigationController?.popViewController(animated: true)
    }
    
    @IBAction func image6Choosed(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.TaskEditor_VC?.photoImageView.image = UIImage(named: "greeting")
         navigationController?.popViewController(animated: true)
    }
    
    @IBAction func image7Choosed(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.TaskEditor_VC?.photoImageView.image = UIImage(named: "FluffyComputer")
         navigationController?.popViewController(animated: true)
    }
    
    @IBAction func image8Choosed(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.TaskEditor_VC?.photoImageView.image = UIImage(named: "FluffyBath")
        navigationController?.popViewController(animated: true)
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

