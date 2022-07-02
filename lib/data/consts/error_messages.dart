class ValidationError {
  static const String blank = "should not be blank";
  static const String invalid = "is not valid";
  static const String short = "should be more than 6 characters";
  static const String onlyHalfWidth = "should be only half-width characters";
  static const String memberExist = "This member has already existed ";
}

class AuthError {
  static const String alreadyUsed = "Email has been already used";
  static const String wrongPass = "Password was wrong";
  static const String notFound = "User was not found";
  static const String other = "Something went wrong";
}
