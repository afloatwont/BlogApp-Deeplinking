import 'package:firebase_core/firebase_core.dart';
import 'logger.dart';

class AppError extends Error {
  final String message;
  final String code;
  final dynamic originalError;

  AppError(this.message, {this.code = 'unknown', this.originalError});

  @override
  String toString() => 'AppError: $message (code: $code)';
}

class ErrorHandler {
  static String handleError(dynamic error) {
    logger.e('Error occurred: $error');

    if (error is FirebaseException) {
      return _handleFirebaseError(error);
    }
    
    if (error is AppError) {
      return error.message;
    }

    return 'An unexpected error occurred. Please try again.';
  }

  static String _handleFirebaseError(FirebaseException error) {
    switch (error.code) {
      case 'not-found':
        return 'The requested resource was not found';
      case 'permission-denied':
        return 'You don\'t have permission to access this resource';
      default:
        return error.message ?? 'An error occurred with Firebase';
    }
  }
}