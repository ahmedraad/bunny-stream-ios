**STRUCT**

# `Schemas.StorageObjectModel`

```swift
public struct StorageObjectModel: Codable, Hashable, Sendable
```

- Remark: Generated from `#/components/schemas/StorageObjectModel`.

## Properties
### `guid`

```swift
public var guid: Swift.String?
```

- Remark: Generated from `#/components/schemas/StorageObjectModel/guid`.

### `storageZoneName`

```swift
public var storageZoneName: Swift.String?
```

- Remark: Generated from `#/components/schemas/StorageObjectModel/storageZoneName`.

### `path`

```swift
public var path: Swift.String?
```

- Remark: Generated from `#/components/schemas/StorageObjectModel/path`.

### `objectName`

```swift
public var objectName: Swift.String?
```

- Remark: Generated from `#/components/schemas/StorageObjectModel/objectName`.

### `length`

```swift
public var length: Swift.Int64?
```

- Remark: Generated from `#/components/schemas/StorageObjectModel/length`.

### `lastChanged`

```swift
public var lastChanged: Foundation.Date?
```

- Remark: Generated from `#/components/schemas/StorageObjectModel/lastChanged`.

### `serverId`

```swift
public var serverId: Swift.Int32?
```

- Remark: Generated from `#/components/schemas/StorageObjectModel/serverId`.

### `isDirectory`

```swift
public var isDirectory: Swift.Bool?
```

- Remark: Generated from `#/components/schemas/StorageObjectModel/isDirectory`.

### `userId`

```swift
public var userId: Swift.String?
```

- Remark: Generated from `#/components/schemas/StorageObjectModel/userId`.

### `contentType`

```swift
public var contentType: Swift.String?
```

- Remark: Generated from `#/components/schemas/StorageObjectModel/contentType`.

### `dateCreated`

```swift
public var dateCreated: Foundation.Date?
```

- Remark: Generated from `#/components/schemas/StorageObjectModel/dateCreated`.

### `storageZoneId`

```swift
public var storageZoneId: Swift.Int64?
```

- Remark: Generated from `#/components/schemas/StorageObjectModel/storageZoneId`.

### `checksum`

```swift
public var checksum: Swift.String?
```

- Remark: Generated from `#/components/schemas/StorageObjectModel/checksum`.

### `replicatedZones`

```swift
public var replicatedZones: Swift.String?
```

- Remark: Generated from `#/components/schemas/StorageObjectModel/replicatedZones`.

### `additionalProperties`

```swift
public var additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer
```

A container of undocumented properties.

## Methods
### `init(guid:storageZoneName:path:objectName:length:lastChanged:serverId:isDirectory:userId:contentType:dateCreated:storageZoneId:checksum:replicatedZones:additionalProperties:)`

```swift
public init(
    guid: Swift.String? = nil,
    storageZoneName: Swift.String? = nil,
    path: Swift.String? = nil,
    objectName: Swift.String? = nil,
    length: Swift.Int64? = nil,
    lastChanged: Foundation.Date? = nil,
    serverId: Swift.Int32? = nil,
    isDirectory: Swift.Bool? = nil,
    userId: Swift.String? = nil,
    contentType: Swift.String? = nil,
    dateCreated: Foundation.Date? = nil,
    storageZoneId: Swift.Int64? = nil,
    checksum: Swift.String? = nil,
    replicatedZones: Swift.String? = nil,
    additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer = .init()
)
```

Creates a new `StorageObjectModel`.

- Parameters:
  - guid:
  - storageZoneName:
  - path:
  - objectName:
  - length:
  - lastChanged:
  - serverId:
  - isDirectory:
  - userId:
  - contentType:
  - dateCreated:
  - storageZoneId:
  - checksum:
  - replicatedZones:
  - additionalProperties: A container of undocumented properties.

#### Parameters

| Name | Description |
| ---- | ----------- |
| guid |  |
| storageZoneName |  |
| path |  |
| objectName |  |
| length |  |
| lastChanged |  |
| serverId |  |
| isDirectory |  |
| userId |  |
| contentType |  |
| dateCreated |  |
| storageZoneId |  |
| checksum |  |
| replicatedZones |  |
| additionalProperties | A container of undocumented properties. |

### `init(from:)`

```swift
public init(from decoder: any Decoder) throws
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| decoder | The decoder to read data from. |

### `encode(to:)`

```swift
public func encode(to encoder: any Encoder) throws
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| encoder | The encoder to write data to. |