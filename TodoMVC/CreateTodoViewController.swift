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
}

class CreateTodoViewController: UIViewController, ICreateTodoView {
    @IBOutlet weak var textField: UITextField?
    private lazy var wireframe = CreateTodoWireframe()
    private var presenter: CreateTodoPresenter?
    private var service: TodoService?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CreateTodoPresenter(createTodoView: self)
        service = TodoService(authManager: AuthManager.sharedManager)
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
    
    func goBack() {
    }
    
    func addTodo() {
        let todoText = textField?.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        guard let text = todoText where text.characters.count > 0 else {
            showAlertWithMessage("Please enter the todo description")
            return
        }
        startLoading()
        service?.createTodo(text, success: {[weak self] (_) in
            self?.stopLoading()
            self?.wireframe.goBack()
            }, failure: {[weak self] (error) in
                self?.stopLoading()
                self?.showErrorMessage(error?.localizedDescription ?? "Cannot create Todo")
            })

    }
}
