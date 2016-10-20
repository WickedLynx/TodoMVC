//
//  CreateTodoAssembly.swift
//  TodoMVC
//
//  Created by admin on 20/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation
import Swinject

class CreateToDoAssembly : AssemblyType {
    
    func assemble(container: Container){

        container.register(AuthManager.self){ _ in
            return AuthManager.sharedManager
        }
        
        container.register(ICreateTodoWireframe.self){ _ in
            return CreateTodoWireframe()
        }
        
        container.register(ITodoService.self) { r in
            let authManager = r.resolve(AuthManager.self)!
            return TodoService(authManager: authManager)
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