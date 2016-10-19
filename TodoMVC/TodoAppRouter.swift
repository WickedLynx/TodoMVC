//
//  TodoAppRouter.swift
//  TodoMVC
//
//  Created by Harshad on 11/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation
import UIKit

protocol IAppRouter {
    func pushViewController(viewController: UIViewController, animated: Bool)
    func popCurrentViewController(animated: Bool)
}

class TodoAppRouter : IAppRouter {
    
    static var sharedInstance : IAppRouter!
    let navigationController: UINavigationController
    
    private init(navigationController:UINavigationController){
        self.navigationController = navigationController
    }
    
    
    class func setUpAppRouter() {
        let nc = UIApplication.sharedApplication().delegate?.window??.rootViewController as? UINavigationController

        sharedInstance = TodoAppRouter(navigationController: nc!)
    }
    
    
    func pushViewController(viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func popCurrentViewController(animated: Bool) {
        navigationController.popViewControllerAnimated(animated)
    }
}
