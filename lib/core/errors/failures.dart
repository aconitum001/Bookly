import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection Timeout with apiServer");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response);
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send Time out with apiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("receive Time out with apiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad Certificate  with apiServer");
      case DioExceptionType.cancel:
        return ServerFailure("Request with apiServer was Canceled");
      case DioExceptionType.connectionError:
        return ServerFailure("ConnectionError  with apiServer");
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure("No Internet Connections");
        }
        return ServerFailure("Unexcpected Error, Pleast try later!");

      default:
        return ServerFailure("ErrMessage");
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server Error, Please try again later!");
    } else {
      return ServerFailure("Opps there was an Error, please try again later!");
    }
  }
}
