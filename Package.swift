// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "telegram_bot",
    dependencies: [
        .package(name: "TelegramBotSDK", url: "https://github.com/zmeyc/telegram-bot-swift.git", from: "2.0.0"),
        .package(name: "ArgumentParser", url: "https://github.com/apple/swift-argument-parser", from: "1.0.0")
    ],
    targets: [
        .executableTarget(
            name: "telegram_bot",
            dependencies: [
                "TelegramBotSDK",
                "ArgumentParser"
            ]
        ),
        .testTarget(
            name: "telegram_botTests",
            dependencies: [
                "telegram_bot"
            ]
        ),
    ]
)
