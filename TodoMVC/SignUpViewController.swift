//
//  SignUpViewController.swift
//  TodoMVC
//
//  Created by Harshad on 12/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField?
    @IBOutlet weak var passwordField: UITextField?
    @IBOutlet weak var confirmPasswordField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(SignUpViewController.touchDone))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func touchDone() {
        signUp()
    }
    
    func signUp() {
        let enteredEmail = emailField?.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        guard let email = enteredEmail where email.characters.count > 0 else {
            showAlertWithMessage("Please enter a valid email address")
            return
        }
        let enteredPassword = passwordField?.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        guard let password = enteredPassword where password.characters.count > 5 else {
            showAlertWithMessage("Please enter a password (min 6 digits)")
            return
        }
        let confirmedPassword = confirmPasswordField?.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        guard let reenteredPassword = confirmedPassword where reenteredPassword == password else {
            showAlertWithMessage("Passwords do not match!")
            return
        }
        
        startLoading()
        let url = BASE_URL + "/register"
        Alamofire.request(.POST, url, parameters: ["username" : email, "password" : password], headers: [:]).responseString {[weak self] response in
            self?.stopLoading()
            guard let jsonString = response.result.value else {
                self?.showAlertWithMessage("Could not sign up")
                return
            }
            let signupResponse = SignUpResponse(JSONString: jsonString)
            if let token = signupResponse?.token {
                AuthManager.sharedManager.saveToken(token)
                let listScreen = TodoListViewController(nibName: "TodoListViewController", bundle: nil)
                self?.navigationController?.pushViewController(listScreen, animated: true)
            } else {
                self?.showAlertWithMessage("Could not sign up")
            }
        }
    }

}
