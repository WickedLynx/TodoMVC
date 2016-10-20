//
//  CreateTodoPresenterTest.swift
//  TodoMVC
//
//  Created by Harshad on 12/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation
import MockFive
import Quick
import Nimble

@testable import TodoMVC

class CreateTodoPresenterTest: QuickSpec {
    override func spec() {
        let todoServiceMock = TodoServiceMock()
        let todoViewMock = CreateTodoViewMock()
        let wireframeMock = CreateTodoWireframeMock()
        let presenter = CreateTodoPresenter(service: todoServiceMock,wireframe: wireframeMock)
        presenter.view = todoViewMock
        
        beforeEach {
            todoServiceMock.resetMock()
            todoViewMock.resetMock()
        }
        
        describe("CreateTodoPresenter Tests") {
            it("should show error message if todo text is empty", closure: {
                presenter.addTodo("")
                
                expect(todoViewMock.invocations).to(contain("showErrorMessage(Please enter the todo description)"))
            })
            
            it("should call onCreateTodo if Todo text is valid", closure: { 
                presenter.addTodo("valid todo description")
                
                expect(todoViewMock.invocations).to(contain("onCreateTodo()"))
            })
        }
    }
}