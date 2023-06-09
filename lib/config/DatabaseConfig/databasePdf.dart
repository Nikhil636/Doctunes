const String tableName = "pdf";

class PdfFields {
  static final List<String> values = [
    id,
    title,
    number,
    description,
    content,
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String number = 'number';
  static const String description = 'description';
  static const String content = 'content';
}

class Pdf {
  final int? id;
  final String title;
  final String description;
  final int number;
  final String content;

  const Pdf(
      {this.id,
      required this.title,
      required this.description,
      required this.number,
      required this.content});
  Pdf copy({
    int? id,
    String? title,
    String? description,
    int? number,
    String? content,
  }) =>
      Pdf(
          id: id ?? this.id,
          title: title ?? this.title,
          description: description ?? this.description,
          number: number ?? this.number,
          content: content ?? this.content);
  static Pdf fromJson(Map<String, Object?> json) => Pdf(
        id: json[PdfFields.id] as int?,
        title: json[PdfFields.title] as String,
        description: json[PdfFields.description] as String,
        number: json[PdfFields.number] as int,
        content: json[PdfFields.content] as String,
      );

  Map<String, Object?> toJson() => {
        PdfFields.id: id,
        PdfFields.title: title,
        PdfFields.description: description,
        PdfFields.number: number,
        PdfFields.content: content,
      };
}
