import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final void Function(String) onChanged;
  final String placeHolder;
  final Widget? startIcon;
  final Widget? endIcon;
  final VoidCallback? onEndIconTap;
  final String? errorText;
  final bool isPassword;
  final bool isVisible; // New parameter

  const TextFieldComponent({
    super.key,
    required this.onChanged,
    required this.placeHolder,
    this.startIcon,
    this.endIcon,
    this.onEndIconTap,
    this.errorText,
    this.isPassword = false,
    this.isVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Aligns the text field and error text
      mainAxisSize: MainAxisSize.min, // Keeps the column size minimal
      children: [
        Container(
          height: 44,
          child: TextField(
            onChanged: onChanged,
            obscureText:
                isPassword && !isVisible, // Correct logic for obscureText
            decoration: InputDecoration(
              suffixIcon: endIcon != null
                  ? GestureDetector(
                      onTap: onEndIconTap,
                      child: endIcon,
                    )
                  : null,
              prefixIcon: startIcon,
              hintText: placeHolder,
              errorText: null, // Prevents TextField from shrinking
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            ),
          ),
        ),
        if (errorText != null) //
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              errorText!,
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
