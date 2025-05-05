class HttpExceptions implements Exception {
  final String message;
  final int statusCode;

  HttpExceptions({
    required this.message,
    required this.statusCode,
  });

  @override
  String toString() {
    super.toString();
    return message;
  }
}
