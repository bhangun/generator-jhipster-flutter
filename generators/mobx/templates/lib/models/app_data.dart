class AppData {
  int id;
  String title;
  String message;
  String status;
  String flag;

  AppData({
    this.id,
    this.title,
    this.message,
    this.status,
    this.flag
  });

  factory AppData.fromMap(Map<String, dynamic> json) => AppData(
        id: json["id"],
        title: json["title"],
        message: json["message"],
        status: json["status"],
        flag: json["flag"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "message": message,
        "status": status,
        "flag": flag,
      };
  
}
