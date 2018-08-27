//
//  ViewController.swift
//  RokoBitTest
//
//  Created by Olena Demkovska on 8/23/18.
//  Copyright © 2018 Olena Demkovska. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    
    
    // MARK: Outlet
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var wrongPassword: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if (CoreDataManager.getUser() != nil) {
            pushDetailVC()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupUI()
    }

    
    // MARK: Actions
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if checkIfOlFiealdIsCorrect() {
            loginUser()
        }
    }
    // Mark: Local validation
    func checkIfOlFiealdIsCorrect() -> Bool {
        if (passwordTextField.text?.count)! >= 7 && (phoneTextField.text?.count)! >= 6 {
            return true
        }
        wrongPassword.text = "Phone number or Password is so short"
        wrongPassword.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return false
    }
    // Mark: Logination
    func loginUser() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        NetworkManager.shared.loginUser(login: "961235555", password: "test") { [weak self] (userProfile, error) in
            self?.activityIndicator.isHidden = true
            self?.activityIndicator.startAnimating()
            if error == nil {
                CoreDataManager.saveUser(userProfile!)
                self?.pushDetailVC()
            } else {
                self?.wrongPassword.text = "Wrong Passwod or Phone number"
                self?.wrongPassword.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }
        }
    }
    
}

    // Mark: Setup UI
extension LoginViewController {
    func setupUI() {
        activityIndicator.isHidden = true
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        UINavigationBar.appearance().barTintColor = UIColor.black
        phoneView.layer.cornerRadius = 5
        enterButton.layer.borderWidth = 1
        enterButton.layer.cornerRadius = 5
    }
}

// DetailVC pushing
extension LoginViewController {
    func pushDetailVC() {
        let vc = storyboard!.instantiateViewController(withIdentifier: String(describing: DetaillViewController.self))  as? DetaillViewController
        navigationController?.pushViewController(vc!, animated: true)
    }
}


