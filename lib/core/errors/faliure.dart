import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!);
      case DioExceptionType.cancel:
        return ServerFailure('Request Cancelled');
      case DioExceptionType.unknown:
        return ServerFailure('Something went wrong');
      default:
        return ServerFailure('Something went wrong');
    }
  }
  factory ServerFailure.fromResponse(Response response) {
    switch (response.statusCode) {
      case 400:
        return ServerFailure('Bad Request');
      case 401:
        return ServerFailure('Unauthorized');
      case 403:
        return ServerFailure('Forbidden');
      case 404:
        return ServerFailure('Not Found');
      case 500:
        return ServerFailure('Internal Server Error');
      default:
        return ServerFailure('Something went wrong');
    }
  }
}
