//
//  RegistrationScreenPresenter.swift
//  MobileExam
//
//  Created by PK Simpson on 08/11/2017.
//
//

import Foundation

class RegistrationScreenPresenter{
    
     var view:RegistrationScreenView?
    private let operationQueue: OperationQueue = OperationQueue()
    
    init(view:RegistrationScreenView) {
        self.view = view
    }
    
    
    public func registerUser(_ user:User){
        
        let operation = RegisterUserAsyncOperation(user: user, callback:view!)
        
        operationQueue.addOperation(operation)
    
    }
}
