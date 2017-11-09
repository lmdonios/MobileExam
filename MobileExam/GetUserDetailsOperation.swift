//
//  GetUserDetailsOperation.swift
//  MobileExam
//
//  Created by PK Simpson on 09/11/2017.
//
//

import Foundation

extension User {
    public mutating func read(){
        
        let defaults = UserDefaults.standard
        
        self.firstname = defaults.string(forKey: "firstname")
        self.lastname = defaults.string(forKey: "lastname")
        self.email = defaults.string(forKey: "email")
        self.mobile = defaults.string(forKey: "mobile")
        self.address = defaults.string(forKey: "address")
        self.city = defaults.string(forKey: "city")
        self.state = defaults.string(forKey: "state")
        self.zip = defaults.string(forKey: "zip")
        self.username = defaults.string(forKey: "username")
        self.password = defaults.string(forKey: "password")
        self.tokenID = defaults.string(forKey: "tokenID")
        self.tokenKey = defaults.string(forKey: "tokenKey")
        
    }
}
