// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BunnyNet",
  platforms: [.iOS(.v15), .macOS(.v13)],
  products: [
    .library(name: "BunnyNetClient", targets: ["BunnyNetClient"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-openapi-generator", branch: "main"),
    .package(url: "https://github.com/apple/swift-openapi-runtime", branch: "main"),
    .package(url: "https://github.com/apple/swift-openapi-urlsession", branch: "main"),
  ],
  targets: [
    .target(
      name: "BunnyNetClient",
      dependencies: [
        .product(
          name: "OpenAPIRuntime",
          package: "swift-openapi-runtime"
        ),
        .product(
          name: "OpenAPIURLSession",
          package: "swift-openapi-urlsession"
        ),
      ],
      path: "Sources/BunnyNetClient",
      plugins: [
        .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator"),
      ]
    ),
    .testTarget(
      name: "BunnyNetClientTests",
      dependencies: ["BunnyNetClient"],
      path: "Tests/BunnyNetClientTests"),
  ]
)
