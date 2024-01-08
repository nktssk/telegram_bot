//
//  Commands.swift
//  
//
//  Created by Nikita Sosyuk on 08.01.2024.
//

import Foundation

enum Commands: String, CaseIterable {
    case start
    case help
    
    var helpDescription: String {
        switch self {
        case .start:
            return "Начать взаимодействие с ботом"
        case .help:
            return "Рассказать о возможных функциях бота"
        }
    }
}
