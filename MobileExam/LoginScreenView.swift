//
//  LoginScreenView.swift
//  MobileExam
//
//  Created by PK Simpson on 09/11/2017.
//
//

import Foundation

protocol LoginScreenView {
    
    func loginSucess(_ user:User)->Void;
    func loginFailed(_ message:String)->Void;
}
