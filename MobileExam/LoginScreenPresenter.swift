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
    private var view:LoginScreenView?
    
    init(view:LoginScreenView){
        self.view = view
    }
    
    public func loginUser(username:String, password:String){
        
        let operation = LoginUserAsyncOperation(username: username, password:password, callback:view!)
        
        operationQueue.addOperation(operation)
    }
}
