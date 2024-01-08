//
//  File.swift
//  
//
//  Created by Nikita Sosyuk on 08.01.2024.
//

import Foundation

public final class Lazy<T> {
    private let createObject: () -> T
    private let didCreateObject: () -> Bool
    
    public private(set) lazy var lazy: T = {
        self.createObject()
    }()
    
    public var didCreateLazyObject: Bool {
        return didCreateObject()
    }
    
    // MARK: - Init
    public init(createObject: @escaping () -> T) {
        let lock = UnfairLock()
        var createdObject: T?
        
        self.createObject = {
            lock.perform {
                if let createdObject = createdObject {
                    return createdObject
                } else {
                    let newObject = createObject()
                    createdObject = newObject
                    return newObject
                }
            }
        }
        
        self.didCreateObject = {
            lock.perform {
                createdObject != nil
            }
        }
    }
}
