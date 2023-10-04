# BunnyNet Stream iOS SDK

<p align="center">
  <img src="Resources/Images/bunnynet.svg" width="70%" alt="BunnyNet" />
</p>
<p align="center">
    <a href="https://www.swift.org" alt="Swift">
        <img src="https://img.shields.io/badge/Swift-5.8-orange.svg" />
    </a>
    <a href="./LICENSE" alt="License">
        <img src="https://img.shields.io/badge/Licence-MIT-green.svg" />
    </a>
    <a href="https://github.com/poviolabs/bunny-stream-ios/actions/workflows/BuildAndTest.yml" alt="Tests Status">
        <img src="https://github.com/poviolabs/bunny-stream-ios/actions/workflows/BuildAndTest.yml/badge.svg" />
    </a>
</p>

BunnyNet Stream SDK is a powerful and easy-to-use Swift Package Manager (SPM) package that provides Swift API client capabilities for the BunnyNet REST Stream API, along with a video player for smooth content playback.

## Architecture

### 1. Swift API Client for BunnyNet REST API

Generated directly from the BunnyNet OpenAPI specification using Apple's [swift-openapi-generator](https://github.com/apple/swift-openapi-generator). This ensures the SDK is always up-to-date with the latest API endpoints and definitions.

**Structure**:

- **Models**: Data structures representing BunnyNet Stream entities.
- **APIs**: Endpoints as Swift functions to interact with the BunnyNet Stream REST API.
- **Configuration**: Manage API keys, endpoints, and other configurations.

### 2. Video Player

A custom video player built to provide seamless streaming and playback of BunnyNet content.

## Libraries

### [swift-openapi-generator](https://github.com/apple/swift-openapi-generator)

Used to auto-generate the Swift client for the BunnyNet REST API. This ensures:

- Consistency with the API.
- Reducing manual errors.
- Easier maintenance, as updating the client with new API changes is mostly automated.

## Getting Started

1. **Installation**:
   
   Add BunnyNet iOS SDK to your project:

```swift
dependencies: [
    .package(url: "https://github.com/poviolabs/bunny-stream-ios.git", .upToNextMajor(from: "1.0.0"))
]
```

2. Initialization

```swift
let bunnyNetClient = BunnyNetClient(accessKey: "your_access_key")
```

3. Usage

```swift
let output = try await bunnyNetClient.streamAPI.Video_GetVideo(path: .init(libraryId: 312321, videoId: "dwaddaw-e9bb-4b96-dwdw-c17bc6a5292b"))
```

## License

BunnyNet iOS SDK is licensed under [MIT License](https://github.com/poviolabs/bunny-stream-ios/blob/feature/main/LICENSE).
