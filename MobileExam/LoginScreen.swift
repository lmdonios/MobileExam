//
//  LoginScreen.swift
//  MobileExam
//
//  Created by PK Simpson on 08/11/2017.
//
//

import Foundation
import UIKit

class LoginScreen : UIViewController, LoginScreenView{
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var presenter:LoginScreenPresenter?
    
    @IBAction func registerUser(_ sender: UIButton) {
        
    }

    
    @IBAction func loginUser(_ sender: UIButton) {
        
        if presenter==nil{
            presenter = LoginScreenPresenter(view: self)
        }
        
        let username = usernameTextField.text
        let password = passwordTextfield.text
        
        presenter?.loginUser(username: username!, password: password!)
        
    }
    
    func loginSucess(_ user: User) {
        //print("Hello, \(user.username)")
        
        usernameTextField.text = ""
        passwordTextfield.text = ""
        
        self.performSegue(withIdentifier: "login_success", sender: self)
    }
    
    func loginFailed(_ message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}
