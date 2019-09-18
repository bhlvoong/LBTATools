// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "LBTATools",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "LBTATools", targets: ["LBTATools"]),
    ],
    targets: [
        .target(name: "LBTATools",
        .testTarget(name: "LBTAToolsTests", dependencies: ["LBTATools"]
    ]
)
