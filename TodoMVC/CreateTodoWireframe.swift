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
    let router: IAppRouter
    
    init(router: IAppRouter){
        self.router = router
    }
    
    func goBack() {
        router.popCurrentViewController(true)
    }
}
