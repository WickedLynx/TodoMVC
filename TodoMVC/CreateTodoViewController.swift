//
//  CreateTodoViewController.swift
//  TodoMVC
//
//  Created by Harshad on 11/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import UIKit
import Alamofire

protocol ICreateTodoView: class {
    func showErrorMessage(message: String)
    func createTodoWithText(todoText: String)
}

class CreateTodoViewController: UIViewController, ICreateTodoView {
    @IBOutlet weak var textField: UITextField?
    private lazy var wireframe = CreateTodoWireframe()
    private var presenter: CreateTodoPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CreateTodoPresenter(createTodoView: self)
        title = "Add Todo"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(CreateTodoViewController.touchDone))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func touchDone() {
        addTodo()
    }
    
    func showErrorMessage(message: String) {
        showAlertWithMessage(message)
    }
    
    func createTodoWithText(todoText: String) {
    }
    
    func addTodo() {
        let todoText = textField?.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        guard let text = todoText where text.characters.count > 0 else {
            showAlertWithMessage("Please enter the todo description")
            return
        }
        startLoading()
        let url = BASE_URL + "/todos/create"
        Alamofire.request(.POST, url, parameters: ["description" : text], headers: AuthManager.sharedManager.authHeaders).responseString {[weak self] response in
            self?.stopLoading()
            guard let jsonString = response.result.value else {
                let message = response.result.error?.localizedDescription ?? ""
                self?.showAlertWithMessage("Unable to add todo: \(message)")
                return
            }
            let createResponse = CreateTodoResponse(JSONString: jsonString)
            guard let _ = createResponse?.todo where createResponse?.error == nil else {
                self?.showAlertWithMessage(createResponse?.error?.nsError.localizedDescription ?? "Unable to create todo")
                return
            }
            self?.wireframe.goBack()
        }

    }
}
