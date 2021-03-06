//
//  LoginModels.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 26/10/18.
//  Copyright (c) 2018 Erika Albizzati. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates
//
//  Type "usecase" for some magic!

struct LoginScene {
    struct PostLogin {
        
        struct Request {
            var user: String
            var password:String
        }
        
        struct Response {
            var userAccount: UserAccount
        }
        
        struct ViewModel {
            let userAccount: UserAccount
            
            struct UserAccount {
                let userId: Int
                let name: String
                let bankAccount: String
                let agency: String
                let balance: Float
                let userName: String
            }
        }
    }
    
    struct SelectUser {
        struct Request {
        }
    }
}
