import Foundation
import ArgumentParser

@main
struct Start: ParsableCommand {
    @Option(name: .long, help: "Path to images")
    var imagePath: String
    
    @Option(name: .long, help: "Telegram bot token")
    var token: String
    
    @Option(name: .long, help: "Path to string resources at jsonFormat")
    var textResourcePath: String
    
    func run() throws {
        let botStarter = BotStarter()
        
        let resourceManager = ResourceManager(
            textPath: textResourcePath,
            imagePath: imagePath
        )
        let resources = try resourceManager.buildResources()
        resourceManager.startBackgroundUpdates()
        
        try botStarter.start(token: token, resources: resources)
    }
}
