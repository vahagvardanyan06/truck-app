import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final void Function(String) onChanged;
  final String placeHolder;
  final Widget? startIcon;
  final Widget? endIcon;
  final VoidCallback? onEndIconTap;
  final String? errorText; // Add errorText field

  const TextFieldComponent({
    super.key,
    required this.onChanged,
    required this.placeHolder,
    this.startIcon,
    this.endIcon,
    this.onEndIconTap,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: onEndIconTap,
          child: endIcon,
        ),
        prefixIcon: startIcon,
        hintText: placeHolder,
        errorText: errorText, // Set errorText here
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
    );
  }
}
