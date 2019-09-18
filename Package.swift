// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "ZpecterLBTATools",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "ZpecterLBTATools", targets: ["ZpecterLBTATools"]),
    ],
    targets: [
        .target(name: "ZpecterLBTATools",
        .testTarget(name: "ZpecterLBTAToolsTests"
    ]
)
