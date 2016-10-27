//
//  CreateTodoAssembly.swift
//  TodoMVC
//
//  Created by Amiruddin Nagri on 10/26/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation
import Swinject

class CreateTodoAssembly: AssemblyType {
    func assemble(container: Container) {
        container.register(ICreateTodoWireframe.self) { _ -> ICreateTodoWireframe in
            return CreateTodoWireframe()
        }

        container.register(ITodoService.self) { _ -> ITodoService in
            return TodoService(authManager: AuthManager.sharedManager)
        }

        container.register(ICreateTodoPresenter.self) { r -> ICreateTodoPresenter in
            let wireframe = r.resolve(ICreateTodoWireframe.self)
            let service = r.resolve(ITodoService.self)
            return CreateTodoPresenter(service: service!, wireframe: wireframe!)
        }

        container.register(CreateTodoViewController.self) { r -> CreateTodoViewController in
            var presenter = r.resolve(ICreateTodoPresenter.self)
            let view = CreateTodoViewController(presenter: presenter!)
            presenter?.view = view
            return view
        }
    }
}
