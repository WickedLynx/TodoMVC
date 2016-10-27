//
//  TodoAppRouter.swift
//  TodoMVC
//
//  Created by Harshad on 11/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation
import UIKit
import Swinject

protocol ITodoAppRouter {
    var resolver: ResolverType { get }
    func pushViewController(viewController: UIViewController, animated: Bool)
    func popCurrentViewController(animated: Bool)
}

class TodoAppRouter : ITodoAppRouter {
    static let sharedInstance : ITodoAppRouter = TodoAppRouter.setupAppRouter()
    
    let navigationController:UINavigationController
    let assembler: Assembler

    var resolver: ResolverType {
        return assembler.resolver
    }

    private init(navigationController:UINavigationController, assembler: Assembler){
        self.navigationController = navigationController
        self.assembler = assembler
    }
    
    private class func setupAppRouter() -> ITodoAppRouter {
        let assembly = Assembler()
        assembly.applyAssemblies([CreateTodoAssembly()])

        let nc = UIApplication.sharedApplication().delegate?.window??.rootViewController as? UINavigationController
        let appRouter = TodoAppRouter(navigationController:nc!, assembler: assembly)
        return appRouter
    }
    
    func pushViewController(viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func popCurrentViewController(animated: Bool) {
        navigationController.popViewControllerAnimated(animated)
    }
}
