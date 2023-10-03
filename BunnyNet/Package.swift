// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BunnyNet",
  platforms: [.iOS(.v16), .macOS(.v13)],
  products: [
    .library(name: "BunnyNetClient", targets: ["BunnyNetClient"]),
  ],
  dependencies: [
    .package(url: "https://github.com/realm/SwiftLint.git", from: "0.53.0"),
  ],
  targets: [
    .target(
      name: "BunnyNetClient",
      path: "Sources/BunnyNetClient",
      plugins: [.plugin(name: "SwiftLintPlugin", package: "SwiftLint")]),
    .testTarget(
      name: "BunnyNetClientTests",
      dependencies: ["BunnyNetClient"],
      path: "Tests/BunnyNetClientTests"),
  ]
)
