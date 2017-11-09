//
//  LogoutUserAsyncOperation.swift
//  MobileExam
//
//  Created by PK Simpson on 09/11/2017.
//
//

import Foundation
import Alamofire

class LogoutUserAsyncOperation : AsyncOperation {
    
    var tokenID:String?
    var tokenKey:String?
    var callback:WelcomeScreenView?
    
    
    init(tokenID:String, tokenKey:String, callback:WelcomeScreenView) {
        self.tokenID = tokenID
        self.tokenKey = tokenKey
        self.callback = callback
        super.init()
    }
    
    override func start() {
        super.start()
        
        let parameters: Parameters = [
            "token_id": tokenID!,
            "token_key": tokenKey!,
            ]
        
        Alamofire.request("http://54.68.88.28/mobile_exam/api/v1/user-logout", method: .post, parameters: parameters).responseJSON { response in
            
//                        if let json = response.result.value {
//                            print("JSON: \(json)") // serialized json response
//                        }
            
            let responseJSON = response.result.value as? [String: Any]
            if (responseJSON?["error"]) != nil {
                
                let error = responseJSON?["error"] as! Bool
                //let message = responseJSON?["message"] as! String
                
                if !error {
                    
                    let domain = Bundle.main.bundleIdentifier!
                    UserDefaults.standard.removePersistentDomain(forName: domain)
                    UserDefaults.standard.synchronize()
                    
                    self.callback?.logoutUser()
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
