class MessageModel{
  final String message;
  final String senderId;
  final String timestamp;
  final String? mediaPath;
  final String? mediaType;

  MessageModel({
    required this.message,
    required this.timestamp,
    required this.senderId,
    this.mediaPath,
    this.mediaType,
  });

  Map<String, dynamic> toJson() => {
    "message": message,
    "timestamp": timestamp,
    "senderId":senderId,
    "mediaPath": mediaPath,
    "mediaType": mediaType,
  };

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json["message"],
      timestamp: json["timestamp"],
      senderId: json["senderId"] ?? "",
      mediaPath: json["mediaPath"],
      mediaType: json["mediaType"],
    );
  }
}