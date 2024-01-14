**CLASS**

# `BunnyStreamSDK`

```swift
public class BunnyStreamSDK
```

`BunnyStreamSDK` provides the main entry point for interacting with the Bunny Stream API.

## Properties
### `Api`

```swift
public let Api: Client
```

The API client for interacting with the Bunny Stream services.

## Methods
### `init(accessKey:transport:)`

```swift
public init(accessKey: String, transport: ClientTransport = URLSessionTransport())
```

Initializes a new instance of the BunnyStreamSDK.

- Parameters:
  - accessKey: A string representing the access key required for API authentication.
  - transport: An optional parameter for a custom transport layer.
               If not provided, `URLSessionTransport` is used by default.

#### Parameters

| Name | Description |
| ---- | ----------- |
| accessKey | A string representing the access key required for API authentication. |
| transport | An optional parameter for a custom transport layer. If not provided, `URLSessionTransport` is used by default. |