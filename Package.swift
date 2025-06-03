// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ExoGuardian",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "ExoGuardian", targets: ["ExoGuardian"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
        .package(url: "https://github.com/web3swift-team/web3swift.git", from: "3.0.0"),
        .package(url: "https://github.com/yenom/BitcoinKit.git", from: "1.1.0")
    ],
    targets: [
        .executableTarget(
            name: "ExoGuardian",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "web3swift", package: "web3swift")
            ],
            path: "Sources/ExoGuardian"
        ),
        .testTarget(
            name: "ExoGuardianTests",
            dependencies: ["ExoGuardian"],
            path: "Tests/ExoGuardianTests"
        )
    ]
) 