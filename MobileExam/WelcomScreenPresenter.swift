//
//  WelcomScreenPresenter.swift
//  MobileExam
//
//  Created by Louie Donios on 09/11/2017.
//

import Foundation

class WelcomeScreenPresenter {
    
    private let operationQueue: OperationQueue = OperationQueue()
    private var view:WelcomeScreenView?
    
    init(view:WelcomeScreenView) {
        self.view = view
    }
    
    public func logoutUser(_ user:User){
        let operation = LogoutUserAsyncOperation(tokenID: user.tokenID!, tokenKey: user.tokenKey!, callback: view!)
        operationQueue.addOperation(operation)
    }
    
}

