//
//  TodoServiceMock.swift
//  TodoMVC
//
//  Created by Harshad on 12/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation
import MockFive

@testable import TodoMVC

class TodoServiceMock: ITodoService, Mock {
    var mockFiveLock: String = lock()
    func createTodo(text: String, success: (TodoItem) -> Void, failure: (NSError? -> Void)) {
        stub(identifier: "createTodo") {_ in
            let item = TodoItem(description: "Test Todo", identifier: "todo1")
            success(item)
        }
    }
    
}