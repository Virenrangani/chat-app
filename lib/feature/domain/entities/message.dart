class Message {
  final String message;
  final String senderId;
  final String timestamp;
  final String? mediaPath;
  final String? mediaType;

  const Message({
  required this.message,
  required this.senderId,
  required this.timestamp,
  this.mediaPath,
  this.mediaType,
  });
}
