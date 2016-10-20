//
//  CreateTodoWireframe.swift
//  TodoMVC
//
//  Created by Harshad on 11/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation

protocol ICreateTodoWireframe {
    func goBack()
}

class CreateTodoWireframe : ICreateTodoWireframe {
    let router: ITodoAppRouter = TodoAppRouter.sharedInstance
    
    init() {
    }
    
    func goBack() {
        router.popCurrentViewController(true)
    }
}
