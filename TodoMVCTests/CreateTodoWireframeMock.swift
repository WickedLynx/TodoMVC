//
//  CreateTodoWireframeMock.swift
//  TodoMVC
//
//  Created by admin on 20/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation
import MockFive

@testable import TodoMVC

class CreateTodoWireframeMock: ICreateTodoWireframe, Mock {
    var mockFiveLock: String = lock()
    
    func goBack() {
        stub(identifier: "goBack")
    }
}
