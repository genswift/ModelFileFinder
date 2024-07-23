// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SampleLibrary",
		platforms: [
				.iOS(.v17)
		],
    products: [
        .library(
            name: "SampleLibrary",
            targets: ["SampleLibrary"]),
    ],
		dependencies: [
				.package(url: "https://github.com/realm/SwiftLint", branch: "main")
		],
    targets: [
        .target(
            name: "SampleLibrary"
				),
        .testTarget(
            name: "SampleLibraryTests",
            dependencies: ["SampleLibrary"]
				),
    ]
)
