//
//  SaveUserAsyncOperation.swift
//  MobileExam
//
//  Created by PK Simpson on 09/11/2017.
//
//

import Foundation
import Alamofire

class UpdateUserAsyncOperation : AsyncOperation {
    
    var user:User!
    var callback:EditProfileScreenView?
    
    init(user:User, callback:EditProfileScreenView) {
        
        self.user = user
        self.callback = callback
        
        super.init()
    }
    
    override func start() {
        super.start()
        
        let parameters: Parameters = [
            "token_id": user.tokenID!,
            "token_key": user.tokenKey!,
            "firstname": user.firstname!,
            "lastname": user.lastname!,
            "email": user.email!,
            "mobile": user.mobile!,
            "address": user.address!,
            "city": user.city!,
            "state": user.state!,
            "zip": user.zip!,
            "username": user.username!,
            "password": user.password!
    
            ]
        
        Alamofire.request("http://54.68.88.28/mobile_exam/api/v1/user-update", method: .post, parameters: parameters).responseJSON { response in
            
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//            }
            
            let responseJSON = response.result.value as? [String: Any]
            if (responseJSON?["error"]) != nil {
                
                let error = responseJSON?["error"] as! Bool
                let message = responseJSON?["message"] as! String
                
                let success = self.user.update()
                
                if success {
                    self.callback?.editProfileDetailsCompleted(error: error, message: message)
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
