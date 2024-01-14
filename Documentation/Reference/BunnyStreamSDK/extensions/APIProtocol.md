**EXTENSION**

# `APIProtocol`
```swift
extension APIProtocol
```

## Methods
### `Collection_GetCollection(path:headers:)`

```swift
public func Collection_GetCollection(
    path: Operations.Collection_GetCollection.Input.Path,
    headers: Operations.Collection_GetCollection.Input.Headers = .init()
) async throws -> Operations.Collection_GetCollection.Output
```

Get Collection

- Remark: HTTP `GET /library/{libraryId}/collections/{collectionId}`.
- Remark: Generated from `#/paths//library/{libraryId}/collections/{collectionId}/get(Collection_GetCollection)`.

### `Collection_UpdateCollection(path:headers:body:)`

```swift
public func Collection_UpdateCollection(
    path: Operations.Collection_UpdateCollection.Input.Path,
    headers: Operations.Collection_UpdateCollection.Input.Headers = .init(),
    body: Components.RequestBodies.UpdateCollectionModel
) async throws -> Operations.Collection_UpdateCollection.Output
```

Update Collection

- Remark: HTTP `POST /library/{libraryId}/collections/{collectionId}`.
- Remark: Generated from `#/paths//library/{libraryId}/collections/{collectionId}/post(Collection_UpdateCollection)`.

### `Collection_DeleteCollection(path:headers:)`

```swift
public func Collection_DeleteCollection(
    path: Operations.Collection_DeleteCollection.Input.Path,
    headers: Operations.Collection_DeleteCollection.Input.Headers = .init()
) async throws -> Operations.Collection_DeleteCollection.Output
```

Delete Collection

- Remark: HTTP `DELETE /library/{libraryId}/collections/{collectionId}`.
- Remark: Generated from `#/paths//library/{libraryId}/collections/{collectionId}/delete(Collection_DeleteCollection)`.

### `Collection_List(path:query:headers:)`

```swift
public func Collection_List(
    path: Operations.Collection_List.Input.Path,
    query: Operations.Collection_List.Input.Query = .init(),
    headers: Operations.Collection_List.Input.Headers = .init()
) async throws -> Operations.Collection_List.Output
```

Get Collection List

- Remark: HTTP `GET /library/{libraryId}/collections`.
- Remark: Generated from `#/paths//library/{libraryId}/collections/get(Collection_List)`.

### `Collection_CreateCollection(path:headers:body:)`

```swift
public func Collection_CreateCollection(
    path: Operations.Collection_CreateCollection.Input.Path,
    headers: Operations.Collection_CreateCollection.Input.Headers = .init(),
    body: Components.RequestBodies.UpdateCollectionModel
) async throws -> Operations.Collection_CreateCollection.Output
```

Create Collection

- Remark: HTTP `POST /library/{libraryId}/collections`.
- Remark: Generated from `#/paths//library/{libraryId}/collections/post(Collection_CreateCollection)`.

### `Video_GetVideo(path:headers:)`

```swift
public func Video_GetVideo(
    path: Operations.Video_GetVideo.Input.Path,
    headers: Operations.Video_GetVideo.Input.Headers = .init()
) async throws -> Operations.Video_GetVideo.Output
```

Get Video

- Remark: HTTP `GET /library/{libraryId}/videos/{videoId}`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/get(Video_GetVideo)`.

### `Video_UpdateVideo(path:headers:body:)`

```swift
public func Video_UpdateVideo(
    path: Operations.Video_UpdateVideo.Input.Path,
    headers: Operations.Video_UpdateVideo.Input.Headers = .init(),
    body: Operations.Video_UpdateVideo.Input.Body
) async throws -> Operations.Video_UpdateVideo.Output
```

Update Video

- Remark: HTTP `POST /library/{libraryId}/videos/{videoId}`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/post(Video_UpdateVideo)`.

### `Video_UploadVideo(path:query:headers:)`

```swift
public func Video_UploadVideo(
    path: Operations.Video_UploadVideo.Input.Path,
    query: Operations.Video_UploadVideo.Input.Query = .init(),
    headers: Operations.Video_UploadVideo.Input.Headers = .init()
) async throws -> Operations.Video_UploadVideo.Output
```

Upload Video

- Remark: HTTP `PUT /library/{libraryId}/videos/{videoId}`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/put(Video_UploadVideo)`.

### `Video_DeleteVideo(path:headers:)`

```swift
public func Video_DeleteVideo(
    path: Operations.Video_DeleteVideo.Input.Path,
    headers: Operations.Video_DeleteVideo.Input.Headers = .init()
) async throws -> Operations.Video_DeleteVideo.Output
```

Delete Video

- Remark: HTTP `DELETE /library/{libraryId}/videos/{videoId}`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/delete(Video_DeleteVideo)`.

### `Video_GetVideoHeatmap(path:headers:)`

```swift
public func Video_GetVideoHeatmap(
    path: Operations.Video_GetVideoHeatmap.Input.Path,
    headers: Operations.Video_GetVideoHeatmap.Input.Headers = .init()
) async throws -> Operations.Video_GetVideoHeatmap.Output
```

Get Video Heatmap

- Remark: HTTP `GET /library/{libraryId}/videos/{videoId}/heatmap`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/heatmap/get(Video_GetVideoHeatmap)`.

### `Video_GetVideoStatistics(path:query:headers:)`

```swift
public func Video_GetVideoStatistics(
    path: Operations.Video_GetVideoStatistics.Input.Path,
    query: Operations.Video_GetVideoStatistics.Input.Query = .init(),
    headers: Operations.Video_GetVideoStatistics.Input.Headers = .init()
) async throws -> Operations.Video_GetVideoStatistics.Output
```

Get Video Statistics

- Remark: HTTP `GET /library/{libraryId}/statistics`.
- Remark: Generated from `#/paths//library/{libraryId}/statistics/get(Video_GetVideoStatistics)`.

### `Video_ReencodeVideo(path:headers:)`

```swift
public func Video_ReencodeVideo(
    path: Operations.Video_ReencodeVideo.Input.Path,
    headers: Operations.Video_ReencodeVideo.Input.Headers = .init()
) async throws -> Operations.Video_ReencodeVideo.Output
```

Reencode Video

- Remark: HTTP `POST /library/{libraryId}/videos/{videoId}/reencode`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/reencode/post(Video_ReencodeVideo)`.

### `Video_List(path:query:headers:)`

```swift
public func Video_List(
    path: Operations.Video_List.Input.Path,
    query: Operations.Video_List.Input.Query = .init(),
    headers: Operations.Video_List.Input.Headers = .init()
) async throws -> Operations.Video_List.Output
```

List Videos

- Remark: HTTP `GET /library/{libraryId}/videos`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/get(Video_List)`.

### `Video_CreateVideo(path:headers:body:)`

```swift
public func Video_CreateVideo(
    path: Operations.Video_CreateVideo.Input.Path,
    headers: Operations.Video_CreateVideo.Input.Headers = .init(),
    body: Operations.Video_CreateVideo.Input.Body
) async throws -> Operations.Video_CreateVideo.Output
```

Create Video

- Remark: HTTP `POST /library/{libraryId}/videos`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/post(Video_CreateVideo)`.

### `Video_SetThumbnail(path:query:headers:)`

```swift
public func Video_SetThumbnail(
    path: Operations.Video_SetThumbnail.Input.Path,
    query: Operations.Video_SetThumbnail.Input.Query = .init(),
    headers: Operations.Video_SetThumbnail.Input.Headers = .init()
) async throws -> Operations.Video_SetThumbnail.Output
```

Set Thumbnail

- Remark: HTTP `POST /library/{libraryId}/videos/{videoId}/thumbnail`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/thumbnail/post(Video_SetThumbnail)`.

### `Video_FetchNewVideo(path:query:headers:body:)`

```swift
public func Video_FetchNewVideo(
    path: Operations.Video_FetchNewVideo.Input.Path,
    query: Operations.Video_FetchNewVideo.Input.Query = .init(),
    headers: Operations.Video_FetchNewVideo.Input.Headers = .init(),
    body: Operations.Video_FetchNewVideo.Input.Body
) async throws -> Operations.Video_FetchNewVideo.Output
```

Fetch Video

- Remark: HTTP `POST /library/{libraryId}/videos/fetch`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/fetch/post(Video_FetchNewVideo)`.

### `Video_AddCaption(path:headers:body:)`

```swift
public func Video_AddCaption(
    path: Operations.Video_AddCaption.Input.Path,
    headers: Operations.Video_AddCaption.Input.Headers = .init(),
    body: Operations.Video_AddCaption.Input.Body
) async throws -> Operations.Video_AddCaption.Output
```

Add Caption

- Remark: HTTP `POST /library/{libraryId}/videos/{videoId}/captions/{srclang}`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/captions/{srclang}/post(Video_AddCaption)`.

### `Video_DeleteCaption(path:headers:)`

```swift
public func Video_DeleteCaption(
    path: Operations.Video_DeleteCaption.Input.Path,
    headers: Operations.Video_DeleteCaption.Input.Headers = .init()
) async throws -> Operations.Video_DeleteCaption.Output
```

Delete Caption

- Remark: HTTP `DELETE /library/{libraryId}/videos/{videoId}/captions/{srclang}`.
- Remark: Generated from `#/paths//library/{libraryId}/videos/{videoId}/captions/{srclang}/delete(Video_DeleteCaption)`.
