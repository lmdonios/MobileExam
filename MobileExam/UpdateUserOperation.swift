//
//  SaveUserOperation.swift
//  MobileExam
//
//  Created by PK Simpson on 09/11/2017.
//
//

import Foundation

extension User{
    
    public func update()->Bool{
        
        let defaults = UserDefaults.standard
        defaults.set(firstname, forKey:"firstname")
        defaults.set(lastname, forKey:"lastname")
        defaults.set(email, forKey:"email")
        defaults.set(mobile, forKey:"mobile")
        defaults.set(address, forKey:"address")
        defaults.set(city, forKey:"city")
        defaults.set(state, forKey:"state")
        defaults.set(zip, forKey:"zip")
        defaults.set(username, forKey:"username")
        defaults.set(password, forKey:"password")
        defaults.set(tokenID, forKey:"tokenID")
        defaults.set(tokenKey, forKey:"tokenKey")
        
        let success = defaults.synchronize()
        //print("success: \(success)")
        return success
    }

}
