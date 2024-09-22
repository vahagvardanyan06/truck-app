import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final bool isDisabled;
  final bool isLoading;

  const Button({
    super.key,
    required this.onPressed,
    required this.text,
    this.isDisabled = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            isDisabled ? Color(0x8C808080) : Colors.black,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child: isDisabled
            ? Text(
                text,
                style: TextStyle(
                  color: Color(0x8C7C7C7C), // Indicate disabled state
                ),
              )
            : isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
      ),
    );
  }
}
