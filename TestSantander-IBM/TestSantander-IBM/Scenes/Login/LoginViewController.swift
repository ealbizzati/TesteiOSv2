//
//  LoginViewController.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 26/10/18.
//  Copyright (c) 2018 Erika Albizzati. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol LoginViewControllerInput {
    
}

protocol LoginViewControllerOutput {
    func postLogin(request: LoginScene.PostLogin.Request, completionHandler: @escaping (Bool, String?) -> Void)
    func selectUser(request: LoginScene.SelectUser.Request)
}

class LoginViewController: UIViewController, LoginViewControllerInput {
    
    var output: LoginViewControllerOutput?
    var router: LoginRouter?
    
    @IBOutlet weak var tableView: UITableView!
    
    var userAccount: LoginScene.PostLogin.ViewModel.UserAccount? = nil
    var userFromUserDefaults: UserAccount? = nil

    struct cellIdentifiers {
        static let loginCell = "loginCell"
    }

    // MARK: Object lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        LoginConfigurator.sharedInstance.configure(viewController: self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableViewOnLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userFromUserDefaults = retrieveData()
        tableView.reloadData()
    }

    // MARK: Requests
    func retrieveData() -> UserAccount{
        let id = UserDefaults.standard.integer(forKey: "userId")
        let name = UserDefaults.standard.string(forKey: "name")
        let agency = UserDefaults.standard.string(forKey: "agency")
        let bankAccount = UserDefaults.standard.string(forKey: "bankAccount")
        let balance = UserDefaults.standard.float(forKey: "balance")
        let userName = UserDefaults.standard.string(forKey: "userName")
        return UserAccount(userId: id, name: name, bankAccount: bankAccount, agency: agency, balance: balance, userName: userName)
    }

    // MARK: Display logic
    
}

//This should be on configurator but for some reason storyboard doesn't detect ViewController's name if placed there
extension LoginViewController: LoginPresenterOutput {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.passDataToNextScene(for: segue)
    }
}