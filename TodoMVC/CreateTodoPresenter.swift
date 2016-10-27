//
//  CreateTodoPresenter.swift
//  TodoMVC
//
//  Created by Harshad on 12/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation

protocol ICreateTodoPresenter {
    var view: ICreateTodoView? { get set }

    func addTodo(todoText: String?)

    func goBack()
}


class CreateTodoPresenter : ICreateTodoPresenter {
    internal weak var view: ICreateTodoView?
    private let service: ITodoService
    private let wireframe:ICreateTodoWireframe
    
    init(service: ITodoService, wireframe:ICreateTodoWireframe) {
        self.service = service
        self.wireframe = wireframe
    }

    func addTodo(todoText: String?) {
        guard let text = todoText where text.characters.count > 0 else {
            view?.showErrorMessage("Please enter the todo description")
            return
        }
        view?.showLoading()
        service.createTodo(text, success: {[weak self] (_) in
            self?.view?.hideLoading()
            self?.view?.onCreateTodo()
            }, failure: {[weak self] (error) in
                self?.view?.hideLoading()
                self?.view?.showErrorMessage(error?.localizedDescription ?? "Cannot create Todo")
            })
    }
    
    func goBack() {
        wireframe.goBack()
    }
}


