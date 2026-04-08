class MessageModel{
  final String message;
  final String senderId;
  final String timestamp;

  MessageModel({
    required this.message,
    required this.timestamp,
    required this.senderId,
  });

  Map<String, dynamic> toJson() => {
    "message": message,
    "timestamp": timestamp,
    "senderId":senderId,
  };

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json["message"],
      timestamp: json["timestamp"],
      senderId: json["senderId"] ?? "",
    );
  }
}