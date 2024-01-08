//
//  RouteHandler.swift
//  
//
//  Created by Nikita Sosyuk on 08.01.2024.
//

import TelegramBotSDK

protocol RouteHandler {
    func handle(_ context: Context) throws -> Bool
}
