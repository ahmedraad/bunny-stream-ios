// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BunnyNet",
  platforms: [.iOS(.v15), .macOS(.v13)],
  products: [
    .library(name: "BunnyNetClient", targets: ["BunnyNetClient"]),
    .library(name: "BunnyNetVideoUploader", targets: ["BunnyNetVideoUploader"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-openapi-generator", branch: "main"),
    .package(url: "https://github.com/apple/swift-openapi-runtime", branch: "main"),
    .package(url: "https://github.com/apple/swift-openapi-urlsession", branch: "main"),
    .package(url: "https://github.com/tus/TUSKit.git", branch: "main")
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
    .target(
      name: "BunnyNetVideoUploader",
      dependencies: [
        .byName(name: "BunnyNetClient"),
        .product(name: "TUSKit", package: "TUSKit")
      ],
      path: "Sources/BunnyNetVideoUploader"),
    .testTarget(
      name: "BunnyNetClientTests",
      dependencies: ["BunnyNetClient"],
      path: "Tests/BunnyNetClientTests"
    ),
    .testTarget(
      name: "BunnyNetVideoUploaderTests",
      dependencies: ["BunnyNetVideoUploader"],
      path: "Tests/BunnyNetVideoUploaderTests"
    ),
  ]
)
