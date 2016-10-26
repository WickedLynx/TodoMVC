//
//  CreateTodoPresenterTest.swift
//  TodoMVC
//
//  Created by Amiruddin Nagri on 10/25/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation
import Quick
import Nimble
import MockFive

@testable import TodoMVC

class CreateTodoWireframeMock: CreateTodoWireframe, Mock {
    let mockFiveLock: String = lock()

    override func goBack() {
        return stub(identifier: "goBack") { _ -> Void in
            return super.goBack()
        }
    }
}

class CreateTodoViewMock: ICreateTodoView, Mock {
    var mockFiveLock: String = lock()

    func stopLoading() {
        return stub(identifier: "stopLoading") { _ -> Void in
            return
        }
    }

    func startLoading() {
        return stub(identifier: "startLoading") { _ -> Void in
            return
        }
    }

    func showAlertWithMessage(message: String) {
        return stub(identifier: "showAlertWithMessage", arguments: message) { _ -> Void in
            return
        }
    }
}

class TodoServiceMock: TodoService, Mock {
    var mockFiveLock: String = lock()

    override func addTodo(text: String, success: () -> Void, error: (message: String) -> Void) {
        return stub(identifier: "addTodo", arguments: (text, success, error)) { _ -> Void in
            return super.addTodo(text, success: success, error: error)
        }
    }
}

class CreateTodoPresenterTest: QuickSpec {
    override func spec() {

        let createTodoViewMock = CreateTodoViewMock()
        let todoWireframeMock = CreateTodoWireframeMock()
        let todoServiceMock = TodoServiceMock()

        it("should call view with alert message if todo text is empty") {
            let presenter = CreateTodoPresenter(view: createTodoViewMock, todoService: todoServiceMock, wireframe: todoWireframeMock)

            presenter.addTodo("")
            expect(createTodoViewMock.invocations).to(contain("showAlertWithMessage(Please enter the todo description)"))
        }
    }
}
