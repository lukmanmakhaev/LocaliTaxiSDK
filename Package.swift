// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LocaliTaxiSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "LocaliTaxiSDK",
            targets: ["LocaliTaxiSDK"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/kenuuu-x/locali-taxi.git", from: "0.0.1")
    ],
    targets: [
        .target(
            name: "LocaliTaxiSDK",
            dependencies: [
                .product(name: "TaxiShared", package: "locali-taxi")
            ]
        ),
        .testTarget(
            name: "LocaliTaxiSDKTests",
            dependencies: ["LocaliTaxiSDK"]
        )
    ],
    swiftLanguageModes: [.v6]
)
