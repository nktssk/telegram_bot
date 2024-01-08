//
//  Optional+Extension.swift
//  
//
//  Created by Nikita Sosyuk on 08.01.2024.
//

import Foundation

struct UnwrappingError: Error {}

extension Optional {
    func unwrap() throws -> Wrapped {
        if let unwrapped = self {
            return unwrapped
        } else {
            throw UnwrappingError()
        }
    }
}
