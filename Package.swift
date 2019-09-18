// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "ZpecterLBTATools",
    dependencies: [
        
    ],
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "ZpecterLBTATools", targets: ["ZpecterLBTATools"], dependencies: []),
    ],
    targets: [
        .target(name: "ZpecterLBTATools",
        .testTarget(name: "ZpecterLBTAToolsTests"
    ]
)
