//
//  Router+Extensions.swift
//  
//
//  Created by Nikita Sosyuk on 08.01.2024.
//

import TelegramBotSDK

extension Router {
    func addHandler(for command: Commands, with options: Command.Options = [], handler: RouteHandler) {
        add(command.rawValue, options, handler.handle)
    }
}
