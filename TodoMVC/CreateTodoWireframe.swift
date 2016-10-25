//
//  CreateTodoWireframe.swift
//  TodoMVC
//
//  Created by Amiruddin Nagri on 10/25/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation
import UIKit

class CreateTodoWireframe {
    func goBack() {
        let navigationController: UINavigationController? = UIApplication.sharedApplication().windows[0].rootViewController as? UINavigationController
        navigationController?.popViewControllerAnimated(true)
    }
}