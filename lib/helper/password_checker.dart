//uses regex matching to validate passwords
class PasswordChecker{
  static bool isNotValid(String? password){
    return !RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$").hasMatch(password!);
  }
}