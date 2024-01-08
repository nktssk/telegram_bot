//
//  HelpHandler.swift
//  
//
//  Created by Nikita Sosyuk on 08.01.2024.
//

import TelegramBotSDK

final class HelpHandler: BaseRouteHandler {
    override func handle(_ context: Context) throws -> Bool {
        
        context.properties
        
        let respond = Commands.allCases.reduce(resources.strings["helpHeader"] ?? "") { result, command in
            result
                .appending("/")
                .appending(command.rawValue)
                .appending(" - ")
                .appending(command.helpDescription)
                .appending("\n")
        }
        
        context.respondAsync(respond)
        
        return true
    }
}
