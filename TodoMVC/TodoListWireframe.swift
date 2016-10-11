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
        let addController = CreateTodoViewController(nibName: "CreateTodoViewController", bundle: nil)
        router.pushViewController(addController, animated: true)
    }
}