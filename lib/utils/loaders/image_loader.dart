// import 'dart:ui';
//
// /// ImageLoader class to load images on ID platforms.
// class ImageLoader implements platform.ImageLoader {
//   @Deprecated('Use loadImageAsync instead')
//   @override
//   Stream<ui.Codec> loadBufferAsync(
//     String url,
//     String? cacheKey,
//     StreamController<ImageChunkEvent> chunkEvents,
//     DecoderBufferCallback decode,
//     BaseCacheManager cacheManager,
//     int? maxHeight,
//     int? maxWidth,
//     Map<String, String>? headers,
//     VoidCallback? errorListener,
//     ImageRenderMethodForWeb imageRenderMethodForWeb,
//     VoidCallback evictImage,
//   ) {
//     return _load(
//       url,
//       cacheKey,
//       chunkEvents,
//         (bytes) async {
//
//         }
//     );
// }