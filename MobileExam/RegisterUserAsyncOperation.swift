//
//  RegisterUserOperation.swift
//  MobileExam
//
//  Created by PK Simpson on 08/11/2017.
//
//

import Foundation
import Alamofire


class RegisterUserAsyncOperation:AsyncOperation{
    
    var user:User!

    init(user:User) {
        
        self.user = user
        
        super.init()
    }
    
    override func start() {
        super.start()
        
        
        //"username": "lui",
        //"password": "abc123#"
        
    let parameters: Parameters = ["firstname": user.firstname!,
                                  "lastname": user.lastname!,
                                  "email": user.email!,
                                  "mobile": user.mobile!,
                                  "address": user.address!,
                                  "city": user.city!,
                                  "state": user.state!,
                                  "zip": user.zip!,
                                  "username": user.username!,
                                  "password": user.password!,
                                  ]
        
        Alamofire.request("http://54.68.88.28/mobile_exam/api/v1/user-registration", method: .post, parameters: parameters).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
        
        self.state = .finished
    }
    
    override func cancel() {
        super.cancel()
        
        self.state = .finished
        
    }
}
