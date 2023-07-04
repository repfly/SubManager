// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "SubManager",
    platforms: [
        .iOS(.v15),
        .tvOS(.v15),
        .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SubManager",
            targets: ["SubManager"])
    ],
    dependencies: [
        .package(url: "https://github.com/RevenueCat/purchases-ios.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.2.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SubManager",
            dependencies: [.product(name: "RevenueCat", package: "purchases-ios"),
                           .product(name: "Lottie", package: "lottie-spm")]),
        .testTarget(
            name: "SubManagerTests",
            dependencies: ["SubManager"])
    ]
)
