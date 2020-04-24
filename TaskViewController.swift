//
//  TaskViewController.swift
//  qwerty5
//
//  Created by Арсений on 18.03.2020.
//  Copyright © 2020 Арсений. All rights reserved.
//
import os.log
import UIKit
import UserNotifications

class TaskViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var finishTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    /*
     This value is either passed by `TaskTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new task.
     */
    var task: Task?
   
    let startdatepicker = UIDatePicker()
    let finishdatepicker = UIDatePicker()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.HidesKeyboard()
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
        // Set up views if editing an existing Task.
        if let task = task {
            navigationItem.title = task.name
            nameTextField.text   = task.name
            photoImageView.image = task.photo
            startTextField.text = task.start
            finishTextField.text = task.finish
        }
        
        // Enable the Save button only if the text field has a valid Meal name.
        updateSaveButtonState()
        
        photoImageView.layer.cornerRadius = photoImageView.frame.size.width / 2
        photoImageView.clipsToBounds = true
        
        photoImageView.layer.borderColor = #colorLiteral(red: 0.8342560678, green: 1, blue: 0.9222626054, alpha: 1)
        photoImageView.layer.borderWidth = 3
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.TaskEditor_VC = self
        
        //let localeID = Locale.preferredLanguages.first
        startTextField.inputView = startdatepicker
        startdatepicker.datePickerMode = .dateAndTime
        //startdatepicker.locale = Locale(identifier: localeID!)
        
        finishTextField.inputView = finishdatepicker
        finishdatepicker.datePickerMode = .dateAndTime
        //finishdatepicker.locale = Locale(identifier: localeID!)
        
        //HIDE KEYBOARD ON NAMETEXTFIELD
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        nameTextField.addGestureRecognizer(tap)
        
        //START DATE PICK
        let starttoolbar = UIToolbar()
       starttoolbar.sizeToFit()
        let startdoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(startdoneaction))
        let startflexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
       starttoolbar.setItems([startflexSpace, startdoneButton], animated: true)
        
        startTextField.inputAccessoryView = starttoolbar
        
        //FINISH DATE PICK
        let finishtoolbar = UIToolbar()
        finishtoolbar.sizeToFit()
        let finishdoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(finishdoneaction))
        let finishflexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        finishtoolbar.setItems([finishflexSpace, finishdoneButton], animated: true)
        
        finishTextField.inputAccessoryView = finishtoolbar
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    @objc func finishdoneaction(){
        getDateFromFinishDatePicker()
        view.endEditing(true)
    }

    @objc func startdoneaction(){
        getDateFromStartDatePicker()
        view.endEditing(true)
    }
    
    func getDateFromStartDatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        startTextField.text = formatter.string(from: startdatepicker.date)
        
    }
    
    func getDateFromFinishDatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        finishTextField.text = formatter.string(from: finishdatepicker.date)
        
    }

    //MARK: Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        
        navigationController?.popViewController(animated:true)
       // dismiss(animated: true, completion: nil)
        
        print("Call back!!!!")
        /*
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
            print("puck u")
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The MealViewController is not inside a navigation controller.")
        }
 */
   }
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //The UIViewController class’s implementation doesn’t do anything, but it’s a good habit to always call super.prepare(for:sender:) whenever you override prepare(for:sender:). That way you won’t forget it when you subclass a different class.
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let name = nameTextField.text ?? ""
        let photo = photoImageView.image
        let start = startTextField.text ?? ""
        let finish = finishTextField.text ?? ""
        
        // Set the task to be passed to TaskTableViewController after the unwind segue.
        task = Task(name: name, photo: photo, start: start, finish: finish)
        //This code configures the task property with the appropriate values before segue executes.
    }

    
//MARK: Private Methods
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    func HidesKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
   
    @objc func dismissKeyboard() {
    view.endEditing(true)
    }
}

