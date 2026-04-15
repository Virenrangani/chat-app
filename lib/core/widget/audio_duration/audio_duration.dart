
String formatDuration(Duration? d) {
  if (d == null) return "0:00";

  int minutes = d.inMinutes;
  int seconds = d.inSeconds % 60;

  return "$minutes:${seconds.toString().padLeft(2, '0')}";
}