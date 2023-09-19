import 'package:firebase_auth/firebase_auth.dart';

abstract interface class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure(super.errMessage);

  factory FirebaseAuthFailure.fromAuthException(
      FirebaseAuthException exception) {
    String errorMessage = 'Authentication Error: ';
    switch (exception.code) {
      case 'invalid-email':
        errorMessage += 'Invalid email address.';
        break;
      case 'user-disabled':
        errorMessage += 'User account disabled.';
        break;
      case 'user-not-found':
        errorMessage += 'User not found.';
        break;
      case 'wrong-password':
        errorMessage += 'Wrong password.';
        break;
      case 'too-many-requests':
        errorMessage += 'Too many requests. Try again later.';
        break;
      case 'operation-not-allowed':
        errorMessage += 'Operation not allowed.';
        break;
      case 'account-exists-with-different-credential':
        errorMessage += 'An account with the same email already exists but is associated with a different credential.';
        break;
      case 'invalid-credential':
        errorMessage += 'Invalid credential.';
        break;
      case 'invalid-verification-code':
        errorMessage += 'Invalid verification code.';
        break;
      case 'invalid-verification-id':
        errorMessage += 'Invalid verification ID.';
        break;
      case 'provider-already-linked':
        errorMessage += 'The credential is already associated with a different user.';
        break;
      case 'credential-already-in-use':
        errorMessage += 'The credential is already associated with a user.';
        break;
      default:
        errorMessage += 'An error occurred (${exception.code}).';
        break;
    }

    return FirebaseAuthFailure(errorMessage);
  }
}

class FirebaseFirestoreFailure extends Failure {
  FirebaseFirestoreFailure(super.errMessage);

  factory FirebaseFirestoreFailure.fromFirestoreException(
      FirebaseException exception) {
    String errorMessage = 'Error: ';

    switch (exception.code) {
      case 'cancelled':
        errorMessage += 'The operation was cancelled.';
        break;
      case 'unknown':
        errorMessage += 'An unknown error occurred.';
        break;
      case 'invalid-argument':
        errorMessage += 'An invalid argument was provided.';
        break;
      case 'deadline-exceeded':
        errorMessage += 'The operation exceeded the deadline.';
        break;
      case 'not-found':
        errorMessage += 'The requested resource was not found.';
        break;
      case 'already-exists':
        errorMessage += 'The document or resource already exists.';
        break;
      case 'permission-denied':
        errorMessage += 'Permission denied.';
        break;
      case 'resource-exhausted':
        errorMessage += 'Resource quota has been exceeded.';
        break;
      case 'failed-precondition':
        errorMessage += 'The operation was rejected due to a failed precondition.';
        break;
      case 'aborted':
        errorMessage += 'The operation was aborted.';
        break;
      case 'out-of-range':
        errorMessage += 'The operation was attempted past the valid range.';
        break;
      case 'unimplemented':
        errorMessage += 'The operation is not implemented or not supported.';
        break;
      case 'internal':
        errorMessage += 'Internal server error.';
        break;
      case 'unavailable':
        errorMessage += 'The service is currently unavailable.';
        break;
      case 'data-loss':
        errorMessage += 'Data loss or corruption occurred.';
        break;
      default:
        errorMessage += 'An error occurred (${exception.code}).';
        break;
    }

    return FirebaseFirestoreFailure(errorMessage);
  }
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Ops There was an Error, Please try again');
    }
  }
}
