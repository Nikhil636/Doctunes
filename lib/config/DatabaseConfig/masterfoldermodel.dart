const String tableName = "masterfolders";

class MasterFolderField {
  static const String masterFolderId = "_id1";
  static const String masterFolderName = "masterFolder";
  static const String time = "time";
  static const String numberOFItems = "numberOfItems";
  static final List<String> values = [
    masterFolderName,
    masterFolderId,
    numberOFItems,
    time,
  ];
}
class FolderMedia {
  final int? masterId;
  final String? masterFolderName;
  final DateTime createdTime;
  final int? numberOFItems;
  const FolderMedia({
    this.masterId,
    this.masterFolderName,
    required this.createdTime,
    required this.numberOFItems,
  });
  FolderMedia copy(
          {int? masterId,
          String? masterFolderName,
          DateTime? createdTime,
          int? numberOFItems}) =>
      FolderMedia(
          masterId: masterId ?? this.masterId,
          createdTime: createdTime ?? this.createdTime,
          masterFolderName: masterFolderName ?? this.masterFolderName,
          numberOFItems: numberOFItems ?? this.numberOFItems);

  static FolderMedia fromJson(Map<String, Object?> json) => FolderMedia(
      masterId: json[MasterFolderField.masterFolderId] as int?,
      masterFolderName: json[MasterFolderField.masterFolderName] as String,
      createdTime: DateTime.parse(json[MasterFolderField.time] as String),
      numberOFItems: json[MasterFolderField.numberOFItems] as int);

  Map<String, Object?> toJson() => {
        MasterFolderField.masterFolderId: masterId,
        MasterFolderField.masterFolderName: masterFolderName,
        MasterFolderField.time: createdTime.toIso8601String(),
        MasterFolderField.numberOFItems: numberOFItems,
      };
}
