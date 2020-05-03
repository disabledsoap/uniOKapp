
import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var ResultsView: UIView!
    
    @IBOutlet weak var FirstLabel: UILabel!
    @IBOutlet weak var SecondLabel: UILabel!
    @IBOutlet weak var ThirdLabel: UILabel!
    @IBOutlet weak var FourthLabel: UILabel!
    @IBOutlet weak var FifthLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        ScoreLabel.layer.cornerRadius = 22
        ScoreLabel.layer.masksToBounds = true
        ScoreLabel.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        ResultsView.layer.cornerRadius = 20
        
        
        let ResultText = String(ResultViewController.shareddd.Result!)
        ScoreLabel.text = "\(ResultText)/5"
        
        let FirstText  =  ResultViewController.shareddd.FirstTextAnswer!
        let SecondText =  ResultViewController.shareddd.SecondTextAnswer!
        let ThirdText  =  ResultViewController.shareddd.ThirdTextAnswer!
        let FourthText =  ResultViewController.shareddd.FourthTextAnswer!
        let FifthText  =  ResultViewController.shareddd.FifthTextAnswer!
        
        FirstLabel.text  = FirstText
        SecondLabel.text = SecondText
        ThirdLabel.text  = ThirdText
        FourthLabel.text = FourthText
        FifthLabel.text  = FifthText
        
    }
    @IBAction func BacktoStartTapped(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: StartGameViewController.self) {
                _ =  self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
}
