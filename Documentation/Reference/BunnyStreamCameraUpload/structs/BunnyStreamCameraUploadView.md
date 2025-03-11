**STRUCT**

# `BunnyStreamCameraUploadView`

```swift
public struct BunnyStreamCameraUploadView: View
```

A SwiftUI view that provides camera streaming functionality for Bunny Stream uploads.

This view handles:
- Camera stream configuration and display
- Permission management for camera and microphone
- User controls for streaming
- Status messages via snackbar

Example usage:
```swift
BunnyStreamCameraUploadView(
  accessKey: "<access_key>",
  libraryId: <library_id>
 )
```

## Properties
### `body`

```swift
public var body: some View
```

The body of the view that handles different states:
- Loading state while checking permissions
- Permission request view if permissions aren't granted
- Live stream view if all permissions are granted

## Methods
### `init(accessKey:libraryId:)`

```swift
public init(
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