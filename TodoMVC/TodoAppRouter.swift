//
//  TodoAppRouter.swift
//  TodoMVC
//
//  Created by Harshad on 11/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation
import UIKit

protocol ITodoAppRouter {
    func pushViewController(viewController: UIViewController, animated: Bool)
    func popCurrentViewController(animated: Bool)
}


class TodoAppRouter : ITodoAppRouter{
    
    
    static let sharedInstance : ITodoAppRouter = TodoAppRouter.setupAppRouter()
    
    let navigationController:UINavigationController
    
    private init(navigationController:UINavigationController){
        self.navigationController = navigationController
    }
    
    private class func setupAppRouter() -> ITodoAppRouter {
        let nc = UIApplication.sharedApplication().delegate?.window??.rootViewController as? UINavigationController
        let appRouter = TodoAppRouter(navigationController:nc!)
        return appRouter
    }
    
    func pushViewController(viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func popCurrentViewController(animated: Bool) {
        navigationController.popViewControllerAnimated(animated)
    }
}
