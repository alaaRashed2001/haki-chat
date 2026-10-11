import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      child: isLoading
          ? SizedBox(
              width: 5,
              height: 5,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Text(text),
    );
  }
}
