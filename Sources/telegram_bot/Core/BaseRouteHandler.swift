//
//  BaseRouteHandler.swift
//  
//
//  Created by Nikita Sosyuk on 08.01.2024.
//

import TelegramBotSDK

class BaseRouteHandler: RouteHandler {
    let resources: Resources
    
    init(resources: Resources) {
        self.resources = resources
    }
    
    func handle(_ context: Context) throws -> Bool {
        true
    }
}
