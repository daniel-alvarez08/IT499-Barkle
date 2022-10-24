//
//  AccountViewController.swift
//  Barkle
//
//  Created by Daniel Alvarez on 10/9/22.
//

import UIKit

class AccountViewController: UIViewController {
    //labels and text fields
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var lastField: UITextField!
    @IBOutlet weak var emailAddr: UILabel!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //presents saved data
        var value = UserDefaults.standard.string(forKey: "firstNameInfo")
        if value != nil {
            firstField.text = value
        }
        //if no value, default text is used
        else {
            firstField.text = "First Name"
        }
        value = UserDefaults.standard.string(forKey: "lastNameInfo")
        
        if value != nil {
            lastField.text = value
        }
        else {
            lastField.text = "Last Name"
        }
        value = UserDefaults.standard.string(forKey: "emailInfo")
        
        if value != nil {
            emailField.text = value
        }
        else {
            emailField.text = "Email Address"
        }
    }
    //closes page when button is pressed.
    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }
    //saves data locally
    @IBAction func savePressed(_ sender: Any) {
        UserDefaults.standard.set(firstField.text, forKey: "firstNameInfo")
        UserDefaults.standard.set(lastField.text, forKey: "lastNameInfo")
        UserDefaults.standard.set(emailField.text, forKey: "emailInfo")
    }
}
