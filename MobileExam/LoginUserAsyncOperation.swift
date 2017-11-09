//
//  LoginUserOperation.swift
//  MobileExam
//
//  Created by PK Simpson on 08/11/2017.
//
//

import Foundation
import Alamofire


class LoginUserAsyncOperation:AsyncOperation{
    
    var username:String?
    var password:String?
    var callback: LoginScreenView?
    
    init(username:String, password:String, callback:LoginScreenView) {
        self.username = username
        self.password = password
        self.callback = callback
        super.init()
    }
    
    override func start() {
        super.start()
        
        let parameters: Parameters = [
                                      "username": username!,
                                      "password": password!,
                                      ]
        
        Alamofire.request("http://54.68.88.28/mobile_exam/api/v1/user-login", method: .post, parameters: parameters).responseJSON { response in
            
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//            }
            
            let responseJSON = response.result.value as? [String: Any]
            if (responseJSON?["error"]) != nil {
                
                let error = responseJSON?["error"] as! Bool
                
                if !error {
                    let userJSON = responseJSON?["user"] as? [String: Any]
                    let firstname = userJSON?["fldUserFirstName"] as! String
                    let lastname = userJSON?["fldUserLastName"] as! String
                    let email = userJSON?["fldUserEmail"] as! String
                    let mobile = userJSON?["fldUserMobile"] as! String
                     let address = userJSON?["fldUserAddress"] as! String
                    let city = userJSON?["fldUserCity"] as! String
                    let state = userJSON?["fldUserState"] as! String
                    let zip = userJSON?["fldUserZip"] as! String
                    let username = userJSON?["fldUserUsername"] as! String
                    let tokenID = userJSON?["token_id"] as! String
                    let tokenKey = userJSON?["token_key"] as! String
                    let password = self.password
                    
                    let user = User(firstname: firstname, lastname: lastname, email: email, mobile: mobile, address: address, city: city, state: state, zip: zip, username: username, password: password, tokenID: tokenID, tokenKey:tokenKey)
                    
                    let success = user.update()
                    
                    if success {
                        self.callback!.loginSucess(user)
                    }
                    
                }else{
                    
                    let message = responseJSON?["message"] as! String
                    
                    self.callback!.loginFailed(message)
                }
            }
        }
        
        self.state = .finished
    }
    
    override func cancel() {
        super.cancel()
        
        self.state = .finished
    
    }
}
