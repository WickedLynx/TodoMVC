//
//  CreateTodoViewController.swift
//  TodoMVC
//
//  Created by Harshad on 11/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import UIKit
import Alamofire

protocol ICreateTodoView : class {
    func showAlertWithMessage(message: String)

    func startLoading()

    func stopLoading()
}

class CreateTodoViewController: UIViewController, ICreateTodoView {
    @IBOutlet weak var textField: UITextField?

    var createTodoPresenter: CreateTodoPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        createTodoPresenter = CreateTodoPresenter(view: self, todoService:  TodoService(), wireframe: CreateTodoWireframe())

        title = "Add Todo"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(CreateTodoViewController.touchDone))
        navigationItem.rightBarButtonItem = doneButton
    }

    func touchDone() {
        addTodo()
    }

    func addTodo() {
        let input = textField?.text
        createTodoPresenter?.addTodo(input)
    }
}
