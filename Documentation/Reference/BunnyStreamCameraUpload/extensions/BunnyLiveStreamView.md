**EXTENSION**

# `BunnyStreamCameraUploadView`
```swift
public extension BunnyStreamCameraUploadView
```

## Methods
### `init(accessKey:libraryId:)`

```swift
init(
  accessKey: String,
  libraryId: Int
)
```

Initializes a new instance of the BunnyStreamCameraUploadView.

This initializer sets up the video stream view with the necessary configurations
such as access key,  library ID

- Parameters:
  - accessKey: The access key for authentication.
  - libraryId: The ID of the video library.

Usage Example:
```
struct VideoStreamDemoView: View {
 var body: some View {
   Group { }
    .fullScreenCover(isPresented: $isStreamingPresented,
                     content: {
     BunnyStreamCameraUploadView(
      accessKey: "<access_key>",
      libraryId: <library_id>
     )
  })
 }
}
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| accessKey | The access key for authentication. |
| libraryId | The ID of the video library. |
