//
//  CreateTodoViewMock.swift
//  TodoMVC
//
//  Created by Harshad on 12/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation
import MockFive

@testable import TodoMVC

class CreateTodoViewMock: ICreateTodoView, Mock {
    var mockFiveLock: String = lock()
    
    func showLoading() {
        stub(identifier: "showLoading")
    }
    
    func hideLoading() {
        stub(identifier: "hideLoading")
    }
    
    func showErrorMessage(message: String) {
        stub(identifier: "showErrorMessage", arguments: message)
    }
    
    func onCreateTodo() {
        stub(identifier: "onCreateTodo")
    }
}
