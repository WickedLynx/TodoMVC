//
//  TodoService.swift
//  TodoMVC
//
//  Created by Amiruddin Nagri on 10/25/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation
import Alamofire

class TodoService {
    func addTodo(text: String, success: () -> Void, error: (message: String) -> Void) {
        let url = BASE_URL + "/todos/create"
        Alamofire.request(.POST, url, parameters: ["description" : text], headers: AuthManager.sharedManager.authHeaders).responseString { response in

            guard let jsonString = response.result.value else {
                let message = response.result.error?.localizedDescription ?? ""
                error(message: "Unable to add todo: \(message)")
                return
            }

            let createResponse = CreateTodoResponse(JSONString: jsonString)
            guard let _ = createResponse?.todo where createResponse?.error == nil else {
                let message = createResponse?.error?.nsError.localizedDescription ?? "Unable to create todo"
                error(message: message)
                return
            }
            success()
        }
    }
}
