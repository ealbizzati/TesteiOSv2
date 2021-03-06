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
}

protocol LoginInteractorOutput {
    
}

protocol LoginDataSource {
    var userAccount: UserAccount! {get}
}

protocol LoginDataDestination {
    
}

class LoginInteractor: LoginInteractorInput, LoginDataSource, LoginDataDestination {
    
    var output: LoginInteractorOutput?
    var userAccount: UserAccount!

    var networkManager: NetworkManager!

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Business logic

    func postLogin(request: LoginScene.PostLogin.Request, completionHandler: @escaping (Bool, String?) -> Void){
        
        networkManager.fetchAccountData(req: request) { (api: ApiResponse?, err) in            
            if err != nil {
                completionHandler(false, err)
            } else {
                guard let account = api?.userAccount else {
                    completionHandler(false, api?.error?.message)
                    return
                }
                
                guard let userIdNil = api?.userAccount?.userId else {
                    completionHandler(false, api?.error?.message)
                    return
                }
                
                self.userAccount = account
                UserDefaults.saveUserInUserDefaults(userAccount: account, userName: request.user)
                _ = LoginScene.PostLogin.Response(userAccount: account)
                completionHandler(true, nil)
            }
        }
    }
}
