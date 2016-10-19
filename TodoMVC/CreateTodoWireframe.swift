//
//  CreateTodoWireframe.swift
//  TodoMVC
//
//  Created by Harshad on 11/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation

class CreateTodoWireframe {
    let router: IAppRouter = TodoAppRouter.sharedInstance
    
    func goBack() {
        router.popCurrentViewController(true)
    }
}
