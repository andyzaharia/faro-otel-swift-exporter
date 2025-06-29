// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FaroOtelExporter",
    platforms: [.macOS(.v12), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(
            name: "FaroOtelExporter",
            targets: ["FaroOtelExporter"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/open-telemetry/opentelemetry-swift", exact: "1.16.0")
        //.package(url: "https://github.com/open-telemetry/opentelemetry-swift", branch: "renovate/apple-swift-nio-2.x"),
    ],
    targets: [
        .target(
            name: "FaroOtelExporter",
            dependencies: [
                .product(name: "OpenTelemetrySdk", package: "opentelemetry-swift"),
                .product(name: "OpenTelemetryApi", package: "opentelemetry-swift"),
                .product(name: "OpenTelemetryProtocolExporterHTTP", package: "opentelemetry-swift"),
            ],
            resources: [.copy("PrivacyInfo.xcprivacy")]
        ),
        .testTarget(
            name: "FaroOtelExporterTests",
            dependencies: ["FaroOtelExporter"]
        ),
    ]
)
