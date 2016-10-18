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
    func showLoading()
    func hideLoading()
    func onCreateTodo()
}

class CreateTodoViewController: UIViewController, ICreateTodoView {
    @IBOutlet weak var textField: UITextField?
    private var wireframe:CreateTodoWireframe!
    private var service: ITodoService?
    private var presenter: CreateTodoPresenter?
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        wireframe = CreateTodoWireframe()
        service = TodoService(authManager: AuthManager.sharedManager)
        presenter = CreateTodoPresenter(createTodoView: self, service: service!)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Todo"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(CreateTodoViewController.touchDone))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func showLoading() {
        startLoading()
    }
    
    func hideLoading() {
        stopLoading()
    }
    
    func touchDone() {
        addTodo()
    }
    
    func showErrorMessage(message: String) {
        showAlertWithMessage(message)
    }
    
    func onCreateTodo() {
        wireframe.goBack()
    }
    
    func addTodo() {
        presenter?.addTodo(textField?.text)
    }
}
