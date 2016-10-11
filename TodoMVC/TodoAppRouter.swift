//
//  TodoAppRouter.swift
//  TodoMVC
//
//  Created by Harshad on 11/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation
import UIKit

class TodoAppRouter {
    var navigationController: UINavigationController? {
        return UIApplication.sharedApplication().delegate?.window??.rootViewController as? UINavigationController
    }
    
    func pushViewController(viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func popCurrentViewController(animated: Bool) {
        navigationController?.popViewControllerAnimated(animated)
    }
}
