//
//  CreateTodoPresenter.swift
//  TodoMVC
//
//  Created by Harshad on 12/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation

class CreateTodoPresenter {
    private weak var createTodoView: ICreateTodoView?
    private let service: TodoService
    
    init(createTodoView: ICreateTodoView, service: TodoService) {
        self.createTodoView = createTodoView
        self.service = service
    }
    
    func addTodo(todoText: String?) {
        guard let text = todoText where text.characters.count > 0 else {
            createTodoView?.showErrorMessage("Please enter the todo description")
            return
        }
        createTodoView?.showLoading()
        service.createTodo(text, success: {[weak self] (_) in
            self?.createTodoView?.hideLoading()
            self?.createTodoView?.onCreateTodo()
            }, failure: {[weak self] (error) in
                self?.createTodoView?.hideLoading()
                self?.createTodoView?.showErrorMessage(error?.localizedDescription ?? "Cannot create Todo")
            })
    }
}


