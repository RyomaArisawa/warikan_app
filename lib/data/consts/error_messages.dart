class ValidationError {
  static const String blank = " can't be blank";
  static const String invalid = " is not valid";
  static const String short = " should be more than 6 characters";
  static const String onlyHalfWidth = " should be only half-width characters";
}

class AuthError {
  static const String alreadyUsed = "Email has been already used";
  static const String wrongPass = "Password was wrong";
  static const String notFound = "User was not found";
  static const String other = "Something went wrong";
}
