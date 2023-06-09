const String tableName = "media";

class MediaFields {
  static const String id = '_id';
  static const String title = 'title';
  static const String mediaFile = 'mediaFile';
  static const String description = "description";
  static const String time = "time";
  static const String istext = "istext";
  static const String language = "language";
  static const String imageBytes = 'imageBytes';

  static final List<String> values = [
    id,
    title,
    description,
    time,
    istext,
    language,
    imageBytes
  ];
}

class Media {
  final int? id;
  final String title;
  final String description;
  final String mediaFile;
  final DateTime createdTime;
  final bool istext;
  final String? language;
  final String? imageBytes;
  const Media({
    this.id,
    required this.istext,
    required this.title,
    required this.description,
    required this.mediaFile,
    required this.createdTime,
    required this.language,
    this.imageBytes,
  });

  Media copy({
    int? id,
    bool? istext,
    String? title,
    String? description,
    String? mediaFile,
    DateTime? createdTime,
    String? language,
    String? imageBytes,
  }) =>
      Media(
          id: id ?? this.id,
          istext: istext ?? this.istext,
          title: title ?? this.title,
          description: description ?? this.description,
          mediaFile: mediaFile ?? this.mediaFile,
          createdTime: createdTime ?? this.createdTime,
          language: language);

  static Media fromJson(Map<String, Object?> json) => Media(
        id: json[MediaFields.id] as int?,
        istext: json[MediaFields.istext] == 1,
        title: json[MediaFields.title] as String,
        description: json[MediaFields.description] as String,
        mediaFile: json[MediaFields.mediaFile] as String,
        createdTime: DateTime.parse(json[MediaFields.time] as String),
        language: json[MediaFields.language] as String?,
        imageBytes: json[MediaFields.imageBytes] as String?,
      );

  Map<String, Object?> toJson() => {
        MediaFields.id: id,
        MediaFields.istext: istext ? 1 : 0,
        MediaFields.title: title,
        MediaFields.description: description,
        MediaFields.mediaFile: mediaFile,
        MediaFields.time: createdTime.toIso8601String(),
        MediaFields.language: language,
        MediaFields.imageBytes: imageBytes
      };
}
