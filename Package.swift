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
        .library(
            name: "PopinCall",
            targets: ["PopinCall"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/pusher/pusher-websocket-swift.git", .upToNextMinor(from: "10.1.0")),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/livekit/client-sdk-swift.git", .upToNextMajor(from: "2.10.0")),
        .package(url: "https://github.com/livekit/components-swift.git", .upToNextMinor(from: "0.1.6")),
    ],
    targets: [
        // Pre-built XCFramework hosted on your CDN
        .binaryTarget(
            name: "PopinCallBinary",
            // TODO: Replace with your CDN URL and checksum after running scripts/build-xcframework.sh
            url: "https://<YOUR_CDN>/PopinCall.xcframework.zip",
            checksum: "<SHA256_CHECKSUM>"
        ),
        // Wrapper target that re-exports the binary and declares all dependencies
        .target(
            name: "PopinCall",
            dependencies: [
                "PopinCallBinary",
                "Alamofire",
                .product(name: "PusherSwift", package: "pusher-websocket-swift"),
                "SwiftyJSON",
                .product(name: "LiveKit", package: "client-sdk-swift"),
                .product(name: "LiveKitComponents", package: "components-swift"),
            ],
            path: "Sources/PopinCall"
        ),
    ]
)
