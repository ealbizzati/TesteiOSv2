//
//  StatementListRouter.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 26/10/18.
//  Copyright (c) 2018 Erika Albizzati. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol StatementListRouterInput {
    
}

protocol StatementListRouterDataSource: class {
    
}

protocol StatementListRouterDataDestination: class {
    var user: UserAccount! { get set }
}

class StatementListRouter: StatementListRouterInput {
    
    weak var viewController: StatementListViewController!
    weak private var dataSource: StatementListRouterDataSource!
    weak var dataDestination: StatementListRouterDataDestination!
    
    init(viewController: StatementListViewController, dataSource: StatementListRouterDataSource, dataDestination: StatementListRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    // MARK: Navigation
    
    // MARK: Communication
    
    func passDataToNextScene(for segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        
    }
}