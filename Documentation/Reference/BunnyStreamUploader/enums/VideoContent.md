**ENUM**

# `VideoContent`

```swift
public enum VideoContent: Hashable
```

An enumeration representing the different ways video content can be provided for upload.

`VideoContent` supports two primary methods of providing video content:
- Direct binary data in memory
- A file URL pointing to the video file on disk

## Cases
### `data(_:)`

```swift
case data(Data)
```

Video content provided as binary data in memory.

- Parameter data: The video's binary data.

### `url(_:)`

```swift
case url(URL)
```

Video content provided as a file URL.

- Parameter url: The URL pointing to the video file on disk.
