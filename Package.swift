// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//#if os(Linux) || os(macOS)
////let packageDependencies: [Package.Dependency] = [
////  .package(url: "https://github.com/mapbox/mapbox-directions-swift.git", from: "2.14.0"),
////]
//let targetDependencies: [Target.Dependency] = [
//  .product(name: "MapboxNavigationCore", package: "mapbox-navigation-ios", condition: .when(platforms: [.macOS, .linux])),
//  .product(name: "MapboxNavigationUIKit", package: "mapbox-navigation-ios", condition: .when(platforms: [.iOS])),
//
////  .product(name: "MapboxDirections", package: "mapbox-directions-swift", condition: .when(platforms: [.macOS, .linux])),
//]
//#else
////let packageDependencies: [Package.Dependency] = [
////  .package(url: "https://github.com/mapbox/mapbox-navigation-ios.git", from: "3.5.0"),
////]
//let targetDependencies: [Target.Dependency] = [
////  .product(name: "MapboxDirections", package: "mapbox-directions-swift", condition: .when(platforms: [.macOS, .linux, iOS])),
//]
//#endif

let package = Package(
  name: "movilup-shared",
  platforms: [
    .macOS(.v13),
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
  ],
  targets: [
    // Ts are the basic building blocks of a P, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "MovilupShared",
      dependencies: [
//        .product(name: "Turf", package: "turf-swift"),
//        .product(name: "MapboxDirections", package: "mapbox-directions-swift"),
      ]),
    .testTarget(
      name: "MovilupSharedTests",
      dependencies: [
        .target(name: "MovilupShared"),
      ]),
  ]
)
