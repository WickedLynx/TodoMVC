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
    var router: IAppRouter = TodoAppRouter.sharedInstance
    
    func showCreateTodoScreen() {
        let view = router.resolver.resolve(CreateTodoViewController.self)!
        router.pushViewController(view, animated: true)
    }
}