// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PopinCall",
    platforms: [
        .iOS(.v13),
        .macOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PopinCall",
            targets: ["PopinCall"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/pusher/pusher-websocket-swift.git", .upToNextMinor(from: "10.1.0")),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/livekit/client-sdk-swift.git", .upToNextMajor(from: "2.10.0")),
        .package(url: "https://github.com/livekit/components-swift.git", .upToNextMinor(from: "0.1.6")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PopinCall",
            dependencies: [
                "Alamofire",
                .product(name: "PusherSwift", package: "pusher-websocket-swift"),
                "SwiftyJSON",
                .product(name: "LiveKit", package: "client-sdk-swift"),
                .product(name: "LiveKitComponents", package: "components-swift")
            ],
            path: "PopinCall"
        ),
        .testTarget(
            name: "PopinCallTests",
            dependencies: ["PopinCall"],
            path: "PopinCallTests"
        )
    ]
)
