import 'package:dio/dio.dart';

class CustomDioException implements Exception {
  String? message;

  CustomDioException.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout. Please try again.";
        break;
      case DioExceptionType.sendTimeout:
        message = "Request timeout. Please try again.";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Server took too long to respond. Please try again.";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          statusCode: dioException.response?.statusCode,
          error: dioException.response?.data,
        );
        break;
      case DioExceptionType.cancel:
        message = "Request was cancelled.";
        break;
      case DioExceptionType.connectionError:
        message = "Unable to connect to the server. Please check your connection.";
        break;
      case DioExceptionType.unknown:
      default:
        message = "An unexpected error occurred. Please try again.";
        break;
    }
  }

  String _handleError({int? statusCode, dynamic error}) {
    if (statusCode == null) return "An unexpected error occurred.";

    String? extractedMessage;

    if (error is Map<String, dynamic>) {
      // Get message if available
      extractedMessage = error['message'];

      // Special handling for Laravel-style validation errors
      if (statusCode == 422 && error.containsKey('errors')) {
        final errors = error['errors'];
        if (errors is Map<String, dynamic>) {
          final firstKey = errors.keys.first;
          final fieldErrors = errors[firstKey];
          if (fieldErrors is List && fieldErrors.isNotEmpty) {
            extractedMessage = fieldErrors[0]; // Return the first validation error
          }
        }
      }
    } else if (error is String) {
      extractedMessage = error;
    }

    switch (statusCode) {
      case 400:
        return extractedMessage ?? "Bad request. Please try again.";
      case 401:
        return "You’ve been logged out. Please sign in again.";
      case 403:
        return extractedMessage ?? "Forbidden. You don't have access.";
      case 404:
        return extractedMessage ?? "Resource not found.";
      case 409:
        return extractedMessage ?? "Conflict occurred. Please try again.";
      case 422:
        return extractedMessage ?? "Validation error occurred.";
      case 500:
        return "Internal server error. Please try again later.";
      default:
        return "Unexpected error occurred (Status Code: $statusCode).";
    }
  }

  @override
  String toString() {
    return message ?? "Unknown Dio error";
  }
}
