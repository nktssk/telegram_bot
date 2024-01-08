//
//  Resources.swift
//  
//
//  Created by Nikita Sosyuk on 08.01.2024.
//

import TelegramBotSDK

final class Resources {
    var strings: [String: String]
    var images: [String: Lazy<InputFile?>]
    
    init(
        strings: [String : String],
        images: [String: Lazy<InputFile?>]
    ) {
        self.strings = strings
        self.images = images
    }
}
