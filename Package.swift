// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BunnyNet",
  defaultLocalization: "en",
  platforms: [.iOS(.v15), .macOS(.v13)],
  products: [
    .library(name: "BunnyNetClient", targets: ["BunnyNetClient"]),
    .library(name: "BunnyNetVideoUploader", targets: ["BunnyNetVideoUploader"]),
    .library(name: "BunnyNetVideoPlayer", targets: ["BunnyNetVideoPlayer"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-openapi-generator", branch: "main"),
    .package(url: "https://github.com/apple/swift-openapi-runtime", branch: "main"),
    .package(url: "https://github.com/apple/swift-openapi-urlsession", branch: "main"),
    .package(url: "https://github.com/tus/TUSKit.git", branch: "main"),
    .package(url: "https://github.com/onevcat/Kingfisher.git", branch: "master"),
    .package(url: "https://github.com/dagronf/SwiftSubtitles.git", branch: "main"),
    .package(url: "https://github.com/googleads/swift-package-manager-google-interactive-media-ads-ios.git", exact: "3.18.4")
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
    .target(
      name: "BunnyNetVideoPlayer",
      dependencies: [
        .byName(name: "Kingfisher"),
        .byName(name: "SwiftSubtitles"),
        .byName(name: "BunnyNetClient"),
        .product(name: "GoogleInteractiveMediaAds", package: "swift-package-manager-google-interactive-media-ads-ios")
      ],
      path: "Sources/BunnyNetVideoPlayer",
      resources: [.process("Resources")]
    ),
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
