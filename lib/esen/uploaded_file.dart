import 'dart:convert';
import 'dart:typed_data' show Uint8List;

class ESENUploadedFile {
  const ESENUploadedFile({
    this.name,
    this.bytes,
    this.height,
    this.width,
  });

  final String? name;
  final Uint8List? bytes;
  final double? height;
  final double? width;

  @override
  String toString() =>
      'FFUploadedFile(name: $name, bytes: ${bytes?.length ?? 0}, height: $height, width: $width)';

  String serialize() => jsonEncode(
        {'name': name, 'bytes': bytes, 'height': height, 'width': width},
      );

  static ESENUploadedFile deserialize(String val) {
    final serializedData = jsonDecode(val) as Map<String, dynamic>;
    final data = {
      'name': serializedData['name'] ?? '',
      'bytes': serializedData['bytes'] ?? Uint8List.fromList([]),
      'height': serializedData['height'],
      'width': serializedData['width'],
    };
    return ESENUploadedFile(
      name: data['name'] as String,
      bytes: data['bytes'] as Uint8List,
      height: data['height'] as double?,
      width: data['width'] as double?,
    );
  }

  @override
  int get hashCode => Object.hash(name, bytes, height, width);

  @override
  bool operator ==(other) =>
      other is ESENUploadedFile &&
      name == other.name &&
      bytes == other.bytes &&
      height == other.height &&
      width == other.width;
}
