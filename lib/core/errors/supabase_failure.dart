import 'dart:io';

import 'package:falcon_gym/core/errors/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFailure extends Failure {
  SupabaseFailure({required super.errorMessage});
  factory SupabaseFailure.fromException(Object exception) {
    switch (exception) {
      case AuthException():
        return SupabaseFailure(errorMessage: _authMessage(exception));

      case PostgrestException():
        return SupabaseFailure(errorMessage: _postgrestMessage(exception));

      case StorageException():
        return SupabaseFailure(errorMessage: _storageMessage(exception));

      case SocketException():
        return SupabaseFailure(
          errorMessage:
              'Could not connect. Please check your internet connection.',
        );

      default:
        return SupabaseFailure(errorMessage: exception.toString());
    }
  }
  static String _authMessage(AuthException exception) {
    switch (exception.code) {
      case 'user_already_exists':
        return 'This email is already registered. Please sign in instead.';

      case 'email_not_confirmed':
        return 'Please confirm your email before signing in.';

      case 'invalid_credentials':
        return 'Incorrect email or password.';

      case 'weak_password':
        return 'Your password is too weak. Please choose a stronger password.';

      default:
        return 'Authentication failed. Please try again.';
    }
  }

  static String _postgrestMessage(PostgrestException exception) {
    switch (exception.code) {
      case '23505':
        return 'This data already exists.';
      case '23503':
        return 'This data is linked to another record.';
      case '42501':
        return 'You do not have permission to perform this action.';
      default:
        return 'Something went wrong while accessing the database.';
    }
  }

  static String _storageMessage(StorageException exception) {
    return 'Something went wrong while uploading the file.';
  }
}
