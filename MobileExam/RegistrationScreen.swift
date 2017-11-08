//
//  RegistrationScreen.swift
//  MobileExam
//
//  Created by PK Simpson on 08/11/2017.
//
//

import Foundation
import UIKit

class RegistrationScreen: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileTextfield: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    lazy var presenter = RegistrationScreenPresenter()

    @IBAction func registerUser(_ sender: UIButton) {
        
        var user = User()
        
        if let fname = firstNameTextField.text{
            user.firstname = fname
        }
        
        if let lname = lastNameTextField.text{
            user.lastname = lname
        }
        
        if let email = emailTextField.text{
            user.email = email
        }
        
        if let mobile = mobileTextfield.text{
            user.mobile = mobile
        }
        
        if let address = addressTextField.text{
            user.address = address
        }
        
        if let city = cityTextField.text{
            user.city = city
        }
        
        if let state = stateTextField.text{
            user.state = state
        }
        
        if let zip = zipTextField.text{
            user.zip = zip
        }
        
        if let uname = usernameTextField.text{
            user.username = uname
        }
        
        if let pword = passwordTextField.text{
            user.password = pword
        }
        
        presenter.registerUser(user)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return false
    }
}
