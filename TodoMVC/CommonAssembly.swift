//
//  CommonAssembly.swift
//  TodoMVC
//
//  Created by admin on 19/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import Foundation
import Swinject


class CommonAssembly : AssemblyType{
    
    func assemble(container: Container){
        
        container.register(IAppRouter.self){ _ in
            return TodoAppRouter.sharedInstance
        }

    }
    
}