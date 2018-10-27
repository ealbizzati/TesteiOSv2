//
//  LoginInteractor.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 26/10/18.
//  Copyright (c) 2018 Erika Albizzati. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import Foundation
protocol LoginInteractorInput {
    func postLogin(request: LoginScene.PostLogin.Request, completionHandler: @escaping (Bool, String?) -> Void)
    func selectUser(request: LoginScene.SelectUser.Request)
}

protocol LoginInteractorOutput {
    
}

protocol LoginDataSource {
    var selectedUser: UserAccount! { get }
}

protocol LoginDataDestination {
    
}

class LoginInteractor: LoginInteractorInput, LoginDataSource, LoginDataDestination {
    
    var output: LoginInteractorOutput?
    var userAccount: UserAccount!
    var selectedUser: UserAccount!

    // MARK: Business logic

    func postLogin(request: LoginScene.PostLogin.Request, completionHandler: @escaping (Bool, String?) -> Void){
        HTTPClient.shared.fetchGenericData(urlString: "https://bank-app-test.herokuapp.com/api/login", method: "POST", params: ["user": request.user, "password": request.password]) { (api: ApiResponse?, err) in
            if err != nil {
                completionHandler(false, err)
            } else {
                guard let account = api?.userAccount else {
                    completionHandler(false, "No data")
                    return
                }
                self.userAccount = account
                self.selectedUser = account
                self.saveUserInUserDefaults(userAccount: account, userName: request.user)
                _ = LoginScene.PostLogin.Response(userAccount: account)
                completionHandler(true, nil)
            }
        }
    }
    
    func selectUser(request: LoginScene.SelectUser.Request) {
        selectedUser = userAccount
    }
    
    func saveUserInUserDefaults(userAccount: UserAccount, userName:String){
        UserDefaults.standard.set(userAccount.userId, forKey: "userId")
        UserDefaults.standard.set(userAccount.agency, forKey: "agency")
        UserDefaults.standard.set(userAccount.balance, forKey: "balance")
        UserDefaults.standard.set(userAccount.bankAccount, forKey: "bankAccount")
        UserDefaults.standard.set(userAccount.name, forKey: "name")
        UserDefaults.standard.set(userName, forKey: "userName")
    }

}