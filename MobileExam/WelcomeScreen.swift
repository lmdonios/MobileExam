//
//  WelcomeScreen.swift
//  MobileExam
//
//  Created by PK Simpson on 09/11/2017.
//
//

import Foundation
import UIKit

class WelcomeScreen: UIViewController, WelcomeScreenView {
    
    
    @IBOutlet weak var greetingsLabel: UILabel!
    private var user = User()
    
    var presenter:WelcomeScreenPresenter?
    
    var greetings:String{
        set{
            self.greetingsLabel.text = "Hello, \(newValue)!!!"
        }
        get{
            return self.greetingsLabel.text!
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        user.read()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        self.greetings = user.username!
    }
    
    @IBAction func logoutUser(_ sender: UIBarButtonItem) {
        
        if presenter == nil {
            presenter = WelcomeScreenPresenter(view:self)
        }
        
        presenter?.logoutUser(user)
        
    }
    
    func logoutUser() {
       
        self.dismiss(animated: true, completion: nil)
    }
}

