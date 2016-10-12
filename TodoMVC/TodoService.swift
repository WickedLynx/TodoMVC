//
//  TodoService.swift
//  TodoMVC
//
//  Created by Harshad on 12/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation
import Alamofire

class TodoService {
    let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    func createTodo(text: String, success: (TodoItem) -> Void, failure: (NSError? -> Void)) {
        let url = BASE_URL + "/todos/create"
        Alamofire.request(.POST, url, parameters: ["description" : text], headers: AuthManager.sharedManager.authHeaders).responseString {response in
            guard let jsonString = response.result.value else {
                let message = response.result.error?.localizedDescription ?? "Unable to create todo"
                let error = NSError(domain: "com.gojek.todo", code: 500, userInfo: [NSLocalizedDescriptionKey : message])
                failure(error)
                return
            }
            let createResponse = CreateTodoResponse(JSONString: jsonString)
            guard let item = createResponse?.todo where createResponse?.error == nil else {
                failure(createResponse?.error?.nsError)
                return
            }
            success(item)
        }
    }
    
}