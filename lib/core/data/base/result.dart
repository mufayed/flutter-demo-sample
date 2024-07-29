class Result<T> {
  final T? data;
  final String? message;
  final bool isSuccess;

  Result({this.data, this.message, required this.isSuccess});

  factory Result.success(T data) => Result(data: data, isSuccess: true);

  factory Result.error(String message) =>
      Result(message: message, isSuccess: false);
}