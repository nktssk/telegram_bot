//
//  Lock.swift
//  
//
//  Created by Nikita Sosyuk on 08.01.2024.
//

import Foundation

public protocol Lock: AnyObject {
    func lock()
    func unlock()
}

extension Lock {
    @discardableResult
    public func perform<T> (
        file: String = #filePath,
        function: String = #function,
        line: UInt = #line,
        scope: () throws -> T
    ) rethrows -> T {
        lock()
        defer { unlock() }
        return try scope()
    }
}

public final class UnfairLock: Lock {
    private let lockRef = NSLock()
    
    public func lock() {
        lockRef.lock()
    }
    
    public func unlock() {
        lockRef.unlock()
    }
}
