//
//  EditProfileScreenPresenter.swift
//  MobileExam
//
//  Created by Louie Donios on 09/11/2017.
//

import Foundation

class EditProfileScreenPresenter{
    
    private let operationQueue: OperationQueue = OperationQueue()
    private var view:EditProfileScreenView?
    
    init(view:EditProfileScreenView) {
        self.view = view
    }
    
    public func saveProfileDetails(_ user:User){
        let operation = UpdateUserAsyncOperation(user: user, callback: view!)
        
        operationQueue.addOperation(operation)
    }
}
