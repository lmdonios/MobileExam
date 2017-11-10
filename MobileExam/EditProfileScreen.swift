//
//  EditProfileScreen.swift
//  MobileExam
//
//  Created by Louie Donios on 09/11/2017.
//

import Foundation
import UIKit

class EditProfileScreen:UIViewController, EditProfileScreenView{
    
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    lazy var user = User()
    
    var presenter:EditProfileScreenPresenter?
    
    var firstname:String{
        set {
            self.firstnameTextField.text = newValue
        }
        get{
            return self.firstnameTextField.text!
        }
    }
    
    var lastname:String{
        set{
            self.lastnameTextField.text = newValue
        }
        get{
            return self.lastnameTextField.text!
        }
    }
    
    var email:String{
        set{
            self.emailTextField.text = newValue
        }
        get{
            return self.emailTextField.text!
        }
    }
    
    var mobile:String{
        set{
            self.mobileTextField.text = newValue
        }
        get{
            return self.mobileTextField.text!
        }
    }
    
    var address:String{
        set{
            self.addressTextField.text = newValue
        }
        get{
            return self.addressTextField.text!
        }
    }
    
    var city:String{
        set{
            self.cityTextField.text = newValue
        }
        get{
            return self.cityTextField.text!
        }
    }
    
    var state:String{
        set{
            self.stateTextField.text = newValue
        }
        get{
            return self.stateTextField.text!
        }
    }
    
    var zip:String{
        set{
            self.zipTextField.text = newValue
        }
        get{
            return self.zipTextField.text!
        }
    }
    
    var username:String{
        set{
            self.usernameTextField.text = newValue
        }
        get{
            return self.usernameTextField.text!
            
        }
    }
    
    var password:String{
        set{
            self.passwordTextField.text = newValue
        }
        get{
            return self.passwordTextField.text!
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        user.read()
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.firstname = user.firstname!
        self.lastname = user.lastname!
        self.email = user.email!
        self.mobile = user.mobile!
        self.address = user.address!
        self.city = user.city!
        self.state = user.state!
        self.zip = user.zip!
        self.username = user.username!
        self.password = user.password!
        
        super.viewDidAppear(animated)
    }
    
    @IBAction func saveProfileDetails(_ sender: UIButton) {
        if presenter == nil {
            presenter = EditProfileScreenPresenter(view: self)
        }
        
        user.firstname = firstname
        user.lastname = lastname
        user.email = email
        user.mobile = mobile
        user.address = address
        user.city = city
        user.state = state
        user.zip = zip
        user.username = username
        user.password = password
    
        presenter?.saveProfileDetails(user)
    }
    var error:Bool?
    func editProfileDetailsCompleted(error: Bool, message: String) {
        
        self.error = error
        
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: {
            action in
            if !error{
                self.navigationController?.popViewController(animated: true)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
