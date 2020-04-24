
import UIKit

class StartGameViewController: UIViewController {

    @IBOutlet weak var DescriptionView: UIView!
    @IBOutlet weak var StartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DescriptionView.layer.cornerRadius = 20
        StartButton.layer.cornerRadius = 18
        
    }

}
