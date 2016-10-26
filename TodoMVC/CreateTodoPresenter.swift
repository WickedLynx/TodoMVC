//
//  CreateTodoPresenter.swift
//  TodoMVC
//
//  Created by Amiruddin Nagri on 10/25/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation

class CreateTodoPresenter {
    let todoService: TodoService
    let wireframe: CreateTodoWireframe
    weak var view: ICreateTodoView?

    init(view: ICreateTodoView?, todoService: TodoService, wireframe: CreateTodoWireframe) {
        self.view = view
        self.todoService = todoService
        self.wireframe = wireframe
    }

    func addTodo(input: String?) {
        let todoText = input?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())

        guard let text = todoText where text.characters.count > 0 else {
            self.view?.showAlertWithMessage("Please enter the todo description")
            return
        }

        self.view?.startLoading()
        todoService.addTodo(
            text,
            success: { [weak self] in
                self?.view?.stopLoading()
                self?.wireframe.goBack()
            },
            error: { [weak self]
                (message: String) -> Void in
                self?.view?.stopLoading()
                self?.view?.showAlertWithMessage(message)
            }
        )
    }
}
