class LoginValidate {
  String? validateEmail(String email) {
    const String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final RegExp regex = RegExp(emailPattern);

    return regex.hasMatch(email) ? null : 'Invalid email format';
  }

  String? validatePassword(String password) {
    const String passwordPattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
    final RegExp regex = RegExp(passwordPattern);

    return regex.hasMatch(password)
        ? null
        : 'Password must be at least 8 characters long and contain at least one letter and one number';
  }
}
