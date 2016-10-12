//
//  CreateTodoPresenter.swift
//  TodoMVC
//
//  Created by Harshad on 12/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation

class CreateTodoPresenter {
    private weak var createTodoView: ICreateTodoView?
    
    init(createTodoView: ICreateTodoView) {
        self.createTodoView = createTodoView
    }
    
    func addTodo(text: String?) {
        guard let todoText = text where todoText.characters.count > 0 else {
            createTodoView?.showErrorMessage("Please enter the todo description")
            return
        }
        
        // Call service
    }
}


