// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "imaizume.github.io",
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-html.git", from: "0.4.1"),
                .package(url: "https://github.com/malcommac/SwiftDate.git", from: "7.0.0"),
    ],
    targets: [
        .target(
            name: "imaizume.github.io",
            dependencies: [
                "Html",
                "SwiftDate",
            ]),
        .testTarget(
            name: "imaizume.github.ioTests",
            dependencies: ["imaizume.github.io"])
    ]
)
