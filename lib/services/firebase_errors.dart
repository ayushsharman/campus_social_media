class FirebaseErrors {
  static String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'wrong-password':
        return 'Invalid credentials.';
      case 'ERROR_WEAK_PASSWORD':
        return 'Password is too weak';
      case 'invalid-email':
        return 'Invalid Email';
      case 'ERROR_EMAIL_ALREADY_IN_USE':
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'ERROR_NETWORK_REQUEST_FAILED':
        return 'Network error occurred!';
      case 'ERROR_USER_NOT_FOUND':
      case 'firebase_auth/user-not-found':
        return 'Invalid credentials.';
      case 'ERROR_WRONG_PASSWORD':
        return 'Invalid credentials.';
      case 'firebase_auth/requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';
      default:
        return 'Invalid! Please try again';
    }
  }
}
