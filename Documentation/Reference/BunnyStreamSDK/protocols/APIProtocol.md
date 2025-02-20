**PROTOCOL**

# `APIProtocol`

```swift
public protocol APIProtocol: Sendable
```

A type that performs HTTP operations defined by the OpenAPI document.

## Methods
### `Collection_GetCollection(_:)`

```swift
func Collection_GetCollection(_ input: Operations.Collection_GetCollection.Input) async throws -> Operations.Collection_GetCollection.Output
```

Get Collection

- Remark: HTTP `GET /library/{libraryId}/collections/{collectionId}`.
- Remark: Generated from `#/paths//library/{libraryId}/collections/{collectionId}/get(Collection_GetCollection)`.

### `Collection_UpdateCollection(_:)`

```swift
func Collection_UpdateCollection(_ input: Operations.Collection_UpdateCollection.Input) async throws -> Operations.Collection_UpdateCollection.Output
```

Update Collection

- Remark: HTTP `POST /library/{libraryId}/collections/{collectionId}`.
- Remark: Generated from `#/paths//library/{libraryId}/collections/{collectionId}/post(Collection_UpdateCollection)`.

### `Collection_DeleteCollection(_:)`

```swift
func Collection_DeleteCollection(_ input: Operations.Collection_DeleteCollection.Input) async throws -> Operations.Collection_DeleteCollection.Output
```

Delete Collection

- Remark: HTTP `DELETE /library/{libraryId}/collections/{collectionId}`.
- Remark: Generated from `#/paths//library/{libraryId}/collections/{collectionId}/delete(Collection_DeleteCollection)`.

### `Collection_List(_:)`

```swift
func Collection_List(_ input: Operations.Collection_List.Input) async throws -> Operations.Collection_List.Output
```

Get Collection List

- Remark: HTTP `GET /library/{libraryId}/collections`.
- Remark: Generated from `#/paths//library/{libraryId}/collections/get(Collection_List)`.

### `Collection_CreateCollection(_:)`

```swift
func Collection_CreateCollection(_ input: Operations.Collection_CreateCollection.Input) async throws -> Operations.Collection_CreateCollection.Output
```

Create Collection

- Remark: HTTP `POST /library/{libraryId}/collections`.
- Remark: Generated from `#/paths//library/{libraryId}/collections/post(Collection_CreateCollection)`.

### `Video_GetVideo(_:)`

```swift
func Video_GetVideo(_ input: Operations.Video_GetVideo.Input) async throws -> Operations.Video_GetVideo.Output
```

Get Video

- Remark: HTTP `GET /library/{libraryId}/videos/{videoId}`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/get(Video_GetVideo)`.

### `Video_UpdateVideo(_:)`

```swift
func Video_UpdateVideo(_ input: Operations.Video_UpdateVideo.Input) async throws -> Operations.Video_UpdateVideo.Output
```

Update Video

- Remark: HTTP `POST /library/{libraryId}/videos/{videoId}`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/post(Video_UpdateVideo)`.

### `Video_UploadVideo(_:)`

```swift
func Video_UploadVideo(_ input: Operations.Video_UploadVideo.Input) async throws -> Operations.Video_UploadVideo.Output
```

Upload Video

- Remark: HTTP `PUT /library/{libraryId}/videos/{videoId}`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/put(Video_UploadVideo)`.

### `Video_DeleteVideo(_:)`

```swift
func Video_DeleteVideo(_ input: Operations.Video_DeleteVideo.Input) async throws -> Operations.Video_DeleteVideo.Output
```

Delete Video

- Remark: HTTP `DELETE /library/{libraryId}/videos/{videoId}`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/delete(Video_DeleteVideo)`.

### `Video_GetVideoHeatmap(_:)`

```swift
func Video_GetVideoHeatmap(_ input: Operations.Video_GetVideoHeatmap.Input) async throws -> Operations.Video_GetVideoHeatmap.Output
```

Get Video Heatmap

- Remark: HTTP `GET /library/{libraryId}/videos/{videoId}/heatmap`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/heatmap/get(Video_GetVideoHeatmap)`.

### `Video_GetVideoStatistics(_:)`

```swift
func Video_GetVideoStatistics(_ input: Operations.Video_GetVideoStatistics.Input) async throws -> Operations.Video_GetVideoStatistics.Output
```

Get Video Statistics

- Remark: HTTP `GET /library/{libraryId}/statistics`.
- Remark: Generated from `#/paths//library/{libraryId}/statistics/get(Video_GetVideoStatistics)`.

### `Video_ReencodeVideo(_:)`

```swift
func Video_ReencodeVideo(_ input: Operations.Video_ReencodeVideo.Input) async throws -> Operations.Video_ReencodeVideo.Output
```

Reencode Video

- Remark: HTTP `POST /library/{libraryId}/videos/{videoId}/reencode`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/reencode/post(Video_ReencodeVideo)`.

### `Video_List(_:)`

```swift
func Video_List(_ input: Operations.Video_List.Input) async throws -> Operations.Video_List.Output
```

List Videos

- Remark: HTTP `GET /library/{libraryId}/videos`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/get(Video_List)`.

### `Video_CreateVideo(_:)`

```swift
func Video_CreateVideo(_ input: Operations.Video_CreateVideo.Input) async throws -> Operations.Video_CreateVideo.Output
```

Create Video

- Remark: HTTP `POST /library/{libraryId}/videos`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/post(Video_CreateVideo)`.

### `Video_SetThumbnail(_:)`

```swift
func Video_SetThumbnail(_ input: Operations.Video_SetThumbnail.Input) async throws -> Operations.Video_SetThumbnail.Output
```

Set Thumbnail

- Remark: HTTP `POST /library/{libraryId}/videos/{videoId}/thumbnail`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/thumbnail/post(Video_SetThumbnail)`.

### `Video_FetchNewVideo(_:)`

```swift
func Video_FetchNewVideo(_ input: Operations.Video_FetchNewVideo.Input) async throws -> Operations.Video_FetchNewVideo.Output
```

Fetch Video

- Remark: HTTP `POST /library/{libraryId}/videos/fetch`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/fetch/post(Video_FetchNewVideo)`.

### `Video_AddCaption(_:)`

```swift
func Video_AddCaption(_ input: Operations.Video_AddCaption.Input) async throws -> Operations.Video_AddCaption.Output
```

Add Caption

- Remark: HTTP `POST /library/{libraryId}/videos/{videoId}/captions/{srclang}`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/captions/{srclang}/post(Video_AddCaption)`.

### `Video_DeleteCaption(_:)`

```swift
func Video_DeleteCaption(_ input: Operations.Video_DeleteCaption.Input) async throws -> Operations.Video_DeleteCaption.Output
```

Delete Caption

- Remark: HTTP `DELETE /library/{libraryId}/videos/{videoId}/captions/{srclang}`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/captions/{srclang}/delete(Video_DeleteCaption)`.
