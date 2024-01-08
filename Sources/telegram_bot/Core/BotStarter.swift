//
//  BotStarter.swift
//  
//
//  Created by Nikita Sosyuk on 08.01.2024.
//

import TelegramBotSDK

struct BotStarter {
    func start(token: String, resources: Resources) throws {
        let bot = TelegramBot(token: token)
        bot.defaultParameters["sendMessage"] = ["disable_notification": true]
        let router = Router(bot: bot)

        router.addHandler(
            for: .start,
            with: [.slashRequired],
            handler: StartHandler(resources: resources)
        )
        router.addHandler(
            for: .help,
            with: [.slashRequired],
            handler: HelpHandler(resources: resources)
        )

        while let update = bot.nextUpdateSync() {
            try router.process(update: update)
        }
    }
}
