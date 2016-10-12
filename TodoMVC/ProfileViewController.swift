//
//  ProfileViewController.swift
//  TodoMVC
//
//  Created by Harshad on 12/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton?
    @IBOutlet weak var signUpButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
    }
    
    @IBAction func touchLogin() {
        let loginController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        navigationController?.pushViewController(loginController, animated: true)
    }
    
    @IBAction func touchSignUp() {
        let signUpController = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        navigationController?.pushViewController(signUpController, animated: true)
    }
}
