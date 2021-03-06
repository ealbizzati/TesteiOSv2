//
//  StatementListConfigurator.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 26/10/18.
//  Copyright (c) 2018 Erika Albizzati. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension StatementListInteractor: StatementListViewControllerOutput, StatementListRouterDataSource, StatementListRouterDataDestination {
}

extension StatementListPresenter: StatementListInteractorOutput {
}

class StatementListConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = StatementListConfigurator()
    
    private init() {}
    
    // MARK: Configuration
    
    func configure(viewController: StatementListViewController) {
        
        let presenter = StatementListPresenter()
        presenter.output = viewController
        
        let interactor = StatementListInteractor(networkManager: NetworkManager())
        interactor.output = presenter
        
        let router = StatementListRouter(viewController: viewController, dataSource: interactor, dataDestination: interactor)
        
        viewController.output = interactor
        viewController.router = router
    }
}
