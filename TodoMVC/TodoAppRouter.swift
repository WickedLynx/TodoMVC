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

protocol IAppRouter {
    
    var resolver: ResolverType { get }

    func pushViewController(viewController: UIViewController, animated: Bool)
    func popCurrentViewController(animated: Bool)
}

class TodoAppRouter : IAppRouter {
    
    static var sharedInstance : IAppRouter!
    let navigationController: UINavigationController
    let assembler:Assembler
    
    private init(navigationController:UINavigationController, assembler:Assembler){
        self.navigationController = navigationController
        self.assembler = assembler
    }
    
    
    class func setUpAppRouter() {
        let nc = UIApplication.sharedApplication().delegate?.window??.rootViewController as? UINavigationController
        let assembler = Assembler()
        assembler.applyAssemblies([CreateTodoAssembly()])

        sharedInstance = TodoAppRouter(navigationController: nc!, assembler: assembler)
    }
    
    var resolver: ResolverType {
        return assembler.resolver
    }

    
    func pushViewController(viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func popCurrentViewController(animated: Bool) {
        navigationController.popViewControllerAnimated(animated)
    }
}
