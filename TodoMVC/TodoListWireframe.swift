//
//  ToDoListWireframe.swift
//  TodoMVC
//
//  Created by Harshad on 11/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation
import UIKit

class TodoListWireframe {
    var router: TodoAppRouter
    
    init() {
        router = TodoAppRouter()
    }
    
    func showCreateTodoScreen() {
        let wireframe = CreateTodoWireframe()
        let service = TodoService(authManager: AuthManager.sharedManager)
        let presenter = CreateTodoPresenter(service: service, wireframe:wireframe)
        let view = CreateTodoViewController(presenter: presenter)
        presenter.view = view
        router.pushViewController(view, animated: true)
    }
}