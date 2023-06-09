const String tablename = "childitems";

class ChildFolderField {
  static const String childFolderId = "_id";
  static const String masterFolderId = "_id1";
  static const String childItemName = "childItemName";
  static const String time = "time";
  static final List<String> values = [
    masterFolderId,
    childFolderId,
    childItemName,
    time
  ];
}

class ChildMedia {
  final int? masterId;
  final int? childFolderId;
  final String childItemName;
  final DateTime createdTime;
  const ChildMedia({
    this.masterId,
    this.childFolderId,
    required this.childItemName,
    required this.createdTime,
  });
  ChildMedia copy({
    int? masterId,
    int? childFolderId,
    DateTime? createdTime,
    String? childItemName,
  }) =>
      ChildMedia(
          masterId: masterId ?? this.masterId,
          childFolderId: childFolderId ?? this.childFolderId,
          createdTime: createdTime ?? this.createdTime,
          childItemName: childItemName ?? this.childItemName);
  static ChildMedia fromJson(Map<String, Object?> json) => ChildMedia(
        masterId: json[ChildFolderField.masterFolderId] as int?,
        childFolderId: json[ChildFolderField.childFolderId] as int?,
        createdTime: DateTime.parse(json[ChildFolderField.time] as String),
        childItemName: json[ChildFolderField.childItemName] as String,
      );
  Map<String, Object?> toJson() => {
        ChildFolderField.masterFolderId: masterId,
        ChildFolderField.childFolderId: childFolderId,
        ChildFolderField.time: createdTime.toIso8601String(),
        ChildFolderField.childItemName: childItemName
      };
}
