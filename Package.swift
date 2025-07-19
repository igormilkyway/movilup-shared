// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "MovilupShared",
  platforms: [
    .macOS(.v14),
    .iOS(.v16),
  ],
  products: [
    // Products define the executables and libraries a P produces, making them visible to other Ps.
    .library(
      name: "MovilupShared",
      targets: ["MovilupShared"]),
  ],
  dependencies: [
//    .package(url: "https://github.com/mapbox/turf-swift.git", from: "4.0.0"),
//    .package(url: "https://github.com/mapbox/mapbox-directions-swift.git", from: "2.14.0"),
//    .package(url: "https://github.com/mapbox/turf-swift.git", "2.8.0"..<"2.9.0"),

//    .package(url: "https://github.com/BinaryDennis/mapbox-directions-swift.git", revision: "13e41abb38dfbf21a1703f5249e4ce2b185eb70c"),
//    .package(url: "https://github.com/mapbox/mapbox-directions-swift.git", from: "2.14.0"),
//    .package(url: "https://github.com/apple/swift-openapi-runtime", from: "1.8.2"),
//    .package(url: "https://github.com/swift-server/swift-openapi-vapor", from: "1.0.1"),
//    .package(url: "https://github.com/apple/swift-openapi-generator", from: "1.9.0"),
  ],
  targets: [
    // Ts are the basic building blocks of a P, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "MovilupShared",
      dependencies: [
//        .product(name: "Turf", package: "turf-swift"),
//        .product(name: "MapboxDirections", package: "mapbox-directions-swift"),
//        .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
//        .product(name: "OpenAPIVapor", package: "swift-openapi-vapor"),
      ]),
    .testTarget(
      name: "MovilupSharedTests",
      dependencies: [
        .target(name: "MovilupShared"),
      ]),
  ],
  swiftLanguageModes: [.v5],
//  swiftLanguageVersions: [.version("v6")],
)
