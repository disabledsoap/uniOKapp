
import UIKit

class RootViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var GOButton: UIButton!
    @IBOutlet weak var imageUIImage: UIImageView!
    @IBOutlet weak var NameTextField: UITextField!
    
    let defaults = UserDefaults.standard
    
    struct Name {
        static let NameTextField = "NameTextField"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GOButton.isEnabled = false
        self.HidesKeyboard()
        updateGOButtonState()
        CheckForSavedName()
        // Handle the text field’s user input through delegate callbacks.
        NameTextField.delegate = self
        GOButton.layer.cornerRadius = 8
        imageUIImage.layer.cornerRadius = 10
        imageUIImage.clipsToBounds = true
        }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        GOButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateGOButtonState()
       
    }
    
    private func updateGOButtonState() {
        // Disable the Save button if the text field is empty.
        let text = NameTextField.text ?? ""
        GOButton.isEnabled = !text.isEmpty
    }
    
    func HidesKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func SaveName(_ sender: UIButton) {
        defaults.set(NameTextField.text ?? "", forKey: Name.NameTextField)
        
        NameViewController.sharedd.Name = NameTextField.text ?? ""
    }
    
    func CheckForSavedName(){
        
         NameTextField.text = defaults.value(forKey: Name.NameTextField) as? String ?? ""
    }
    
}



