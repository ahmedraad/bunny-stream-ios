// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BunnyStreamPlayer",
  defaultLocalization: "en",
  platforms: [.iOS(.v15), .macOS(.v13)],
  products: [
    .library(name: "BunnyStreamPlayer", targets: ["BunnyStreamPlayer"])
  ],
  dependencies: [
    .package(url: "https://github.com/onevcat/Kingfisher.git", branch: "master"),
    .package(url: "https://github.com/dagronf/SwiftSubtitles.git", branch: "main"),
    .package(url: "https://github.com/googleads/swift-package-manager-google-interactive-media-ads-ios.git", exact: "3.18.4")
  ],
  targets: [
    .target(
      name: "BunnyStreamPlayer",
      dependencies: [
        .byName(name: "Kingfisher"),
        .byName(name: "SwiftSubtitles"),
        .product(name: "GoogleInteractiveMediaAds", package: "swift-package-manager-google-interactive-media-ads-ios")
      ],
      path: "Sources/BunnyStreamPlayer",
      resources: [.process("Resources")]
    )
  ]
)
