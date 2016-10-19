//
//  CreateTodoAssembly.swift
//  TodoMVC
//
//  Created by admin on 19/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation
import Swinject


class CreateTodoAssembly : AssemblyType{
    
    func assemble(container: Container){
        
        container.register(ICreateTodoWireframe.self){ r in
            let router = r.resolve(IAppRouter.self)!
            return CreateTodoWireframe(router:router)
        }

        container.register(ITodoService.self){ _ in
            return TodoService(authManager: AuthManager.sharedManager)
        }

        container.register(ICreateTodoPresenter.self){ r in
            let service = r.resolve(ITodoService.self)!
            let wireframe = r.resolve(ICreateTodoWireframe.self)!
            return CreateTodoPresenter(service: service, wireframe:wireframe)
        }

        container.register(CreateTodoViewController.self){ r in
            var presenter = r.resolve(ICreateTodoPresenter.self)!
            let view = CreateTodoViewController(presenter: presenter)
            presenter.view = view
            return view
        }
        
    }
}