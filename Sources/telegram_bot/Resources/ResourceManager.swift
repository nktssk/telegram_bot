//
//  ResourceManager.swift
//  
//
//  Created by Nikita Sosyuk on 08.01.2024.
//

import Foundation
import TelegramBotSDK

final class ResourceManager {
    private let textPath: String
    private let imagePath: String
    private var resources: Resources?
    
    init(
        textPath: String,
        imagePath: String
    ) {
        self.textPath = textPath
        self.imagePath = imagePath
    }
    
    func buildResources() throws -> Resources {
        if let resources { return resources }
            
        let strings = try buildStrings()
        let images = try buildImages()
        
        let resources = Resources(strings: strings, images: images)
        self.resources = resources
        
        return resources
    }
    
    func startBackgroundUpdates() {
        let timer = Timer.scheduledTimer(withTimeInterval: 180.0, repeats: true) { _ in
            DispatchQueue.global(qos: .background).async { [weak self] in
                guard
                    let self,
                    let strings = try? self.buildStrings(),
                    let images = try? self.buildImages()
                else { return }
                
                self.resources?.images = images
                self.resources?.strings = strings
            }
        }
        RunLoop.current.add(timer, forMode: .default)
    }
    
    private func buildStrings() throws -> [String: String] {
        return try JSONDecoder().decode(
            [String: String].self,
            from: FileManager.default.contents(atPath: textPath).unwrap()
        )
    }
    
    private func buildImages() throws -> [String: Lazy<InputFile?>] {
        let content = try FileManager.default.contentsOfDirectory(atPath: imagePath)
        let names = try content.map {
            try $0.components(separatedBy: ".").first.unwrap()
        }
        
        var result: [String: Lazy<InputFile?>] = [:]
        zip(names, content).forEach { [imagePath] value in
            let (name, content) = value
            
            let lazyValue = Lazy<InputFile?> {
                let path = imagePath.appending("/").appending(content)
                guard let data = FileManager.default.contents(atPath: path) else { return nil }
                
                return InputFile(filename: name, data: data)
            }
            
            result[name] = lazyValue
        }
        
        return result
    }
}
