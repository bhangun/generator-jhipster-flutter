/// [AppData]
class AppData {
  /// [id] unique
  int id;
  /// [title]
  String? title;
  /// [message] message
  String? message;
  /// [status] status
  String? status;
  /// [flag] status
  String? flag;

  AppData({
    required this.id,
    this.title,
    this.message,
    this.status,
    this.flag
  });

  /// [fromMap]
  factory AppData.fromMap(Map<String, dynamic> json) => AppData(
        id: json["id"],
        title: json["title"],
        message: json["message"],
        status: json["status"],
        flag: json["flag"],
      );

  /// [toMap]
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "message": message,
        "status": status,
        "flag": flag,
      };
  
}
