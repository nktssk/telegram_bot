//
//  StartHandler.swift
//  
//
//  Created by Nikita Sosyuk on 08.01.2024.
//

import TelegramBotSDK

final class StartHandler: BaseRouteHandler {
    override func handle(_ context: Context) throws -> Bool {
        guard
            let user = context.message?.from,
            let chatId = context.chatId,
            let userName = user.username
        else { return false }
        
        context.respondAsync("Добро пожаловать, \(userName) 🙋‍♂️") { [weak self] _, error in
            guard
                error == nil,
                let self,
                let startInfo = self.resources.strings["startInfo"],
                let startImage = self.resources.images["startImage"]?.lazy
            else { return }
            
            context.bot.sendPhotoAsync(chatId: .chat(chatId), photo: .inputFile(startImage)) { _ ,error in
                guard error == nil else { return }
                context.respondAsync(startInfo, parseMode: .markdown)
            }
        }
        
        return true
    }
}
