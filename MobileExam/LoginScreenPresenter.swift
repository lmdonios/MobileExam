//
//  LoginScreenPresenter.swift
//  MobileExam
//
//  Created by PK Simpson on 08/11/2017.
//
//

import Foundation

class LoginScreenPresenter{
    
    private let operationQueue: OperationQueue = OperationQueue()
    
    public func loginUser(username:String, password:String){
        
        let operation = LoginUserOperation(username: "lui", password:"abc123#")
        
        operationQueue.addOperation(operation)
    }
}
