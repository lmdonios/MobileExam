//
//  RegistrationScreenPresenter.swift
//  MobileExam
//
//  Created by PK Simpson on 08/11/2017.
//
//

import Foundation

class RegistrationScreenPresenter{
    
    
    private let operationQueue: OperationQueue = OperationQueue()
    
    
    public func registerUser(_ user:User){
        
        let operation = RegisterUserOperation(user: user)
        
        operationQueue.addOperation(operation)
    
    }
}
