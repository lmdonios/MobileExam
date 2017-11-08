//
//  LoginScreen.swift
//  MobileExam
//
//  Created by PK Simpson on 08/11/2017.
//
//

import Foundation
import UIKit

class LoginScreen : UIViewController{
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    lazy var presenter = LoginScreenPresenter()
    
    @IBAction func registerUser(_ sender: UIButton) {
        
    }

    
    @IBAction func loginUser(_ sender: UIButton) {
        
        presenter.loginUser(username: "", password: "")
        
    }
}
