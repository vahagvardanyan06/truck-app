import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truck_app/components/button.dart';
import 'package:truck_app/components/text_field.dart';
import 'package:truck_app/constants/assets.dart';
import 'package:truck_app/pages/general_page.dart';

class Login extends HookWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final isPasswordVisible = useState(false);
    final isButtonLoading = useState(false);
    final email = useState('');
    final password = useState('');
    final emailError = useState<String?>(null);
    final passwordError = useState<String?>(null);

    String? validateEmail(String email) {
      const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
      final regex = RegExp(emailPattern);
      return regex.hasMatch(email) ? null : 'Invalid email format';
    }

    String? validatePassword(String password) {
      const passwordPattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
      final regex = RegExp(passwordPattern);
      return regex.hasMatch(password)
          ? null
          : 'Password must be at least 8 characters long and contain at least one letter and one number';
    }

    void onEmailChanged(String val) {
      email.value = val;
      emailError.value = validateEmail(email.value);
    }

    void onPasswordChanged(String val) {
      password.value = val;
      passwordError.value = validatePassword(password.value);
    }

    void onPressed() async {
      if (emailError.value == null && passwordError.value == null) {
        isButtonLoading.value = true;
        print('Login button pressed');
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const GeneralPage()),
        );
        isButtonLoading.value = false;
      } else {
        print('Invalid input');
      }
    }

    final isDisabled = email.value.isEmpty ||
        password.value.isEmpty ||
        emailError.value != null ||
        passwordError.value != null;

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(top: 190, right: 10, left: 10),
            child: Column(
              children: [
                SvgPicture.asset(
                  Assets.logo,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                TextFieldComponent(
                  onChanged: onEmailChanged,
                  placeHolder: 'Email',
                  errorText: emailError.value,
                ),
                const SizedBox(height: 10),
                TextFieldComponent(
                  onChanged: onPasswordChanged,
                  placeHolder: 'Password',
                  isPassword: true,
                  isVisible: isPasswordVisible.value,
                  onEndIconTap: () {
                    isPasswordVisible.value = !isPasswordVisible.value;
                  },
                  endIcon: Icon(
                    isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  errorText: passwordError.value,
                ),
                const SizedBox(height: 20),
                Button(
                  onPressed: isDisabled ? null : onPressed,
                  text: 'Login',
                  isLoading: isButtonLoading.value,
                  isDisabled: isDisabled,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
