//
//  LoginUserOperation.swift
//  MobileExam
//
//  Created by PK Simpson on 08/11/2017.
//
//

import Foundation
import Alamofire

class LoginUserOperation:AsyncOperation{
    
    var username:String?
    var password:String?
    
    init(username:String, password:String) {
        self.username = username
        self.password = password
        super.init()
    }
    
    override func start() {
        super.start()
        
        let parameters: Parameters = [
                                      "username": username!,
                                      "password": password!,
                                      ]
        
        Alamofire.request("http://54.68.88.28/mobile_exam/api/v1/user-login", method: .post, parameters: parameters).responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
//            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
//
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
//            }
            
            if let data = response.result.value{
                
                if  (data as? [[String : AnyObject]]) != nil{
                    
                    if let dictionaryArray = data as? Array<Dictionary<String, AnyObject?>> {
                        if dictionaryArray.count > 0 {
                            
                            for i in 0..<dictionaryArray.count{
                                
                                let Object = dictionaryArray[i]
                                if let uId = Object["error"] as? Int{
                                    print("User Id: \(uId)")
                                }
                                // like that you can do for remaining...
                            }
                        }
                    }
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
