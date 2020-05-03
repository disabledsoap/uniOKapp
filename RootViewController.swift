
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
        if NameTextField.hasText {
            GOButton.isEnabled = true
            print("text field not empty")
        } else {
            GOButton.isEnabled = false
            print("text field empty")
        }
        self.HidesKeyboard()
      
   
        
        CheckForSavedName()
        // Handle the text field’s user input through delegate callbacks.
        NameTextField.delegate = self
        GOButton.layer.cornerRadius = 8
        imageUIImage.layer.cornerRadius = 10
        imageUIImage.clipsToBounds = true
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
      //  defaults.set(NameTextField.text ?? "", forKey: Name.NameTextField)
        
      //  NameViewController.sharedd.Name = NameTextField.text ?? ""
        
        if (NameTextField.text!.count) >= 2 {
        defaults.set(NameTextField.text!, forKey: "savename")
        dismiss(animated: true, completion: nil)
        } else {
            showDialog(titleStr: "Try a")
        }
    }
    
    func CheckForSavedName(){
        
         NameTextField.text = defaults.value(forKey: Name.NameTextField) as? String ?? ""
    }
    
    func TextFieldEmpty() {
        if NameTextField.hasText {
            GOButton.isEnabled = true
            print("text field not empty")
        } else {
            GOButton.isEnabled = false
            print("text field empty")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       TextFieldEmpty()
    }
    
    func showDialog(titleStr : String) {
        let alert = UIAlertController(title: titleStr, message: nil, preferredStyle: .alert)
        
        alert.view.tintColor = .black
        
        let cancel = UIAlertAction(title: "Ok", style: .default) { (_) in
            print("Tapted")
        }
        
        alert.addAction(cancel)
        
        present(alert, animated: true)
        
        
    }
    
}



