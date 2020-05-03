
import UIKit

class DepressedFViewController: UIViewController {

    @IBOutlet weak var FinishButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    FinishButton.layer.cornerRadius = 16
        
        
    }
    
    @IBAction func FinishDepressed(_ sender: UIButton) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: StartAnalyzerViewController.self) {
                _ =  self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
        ColorValueVC.shared.ColorValue = 7
        print(ColorValueVC.shared.ColorValue)
        let CalendarVC = CalendarViewController()
        

}
}
