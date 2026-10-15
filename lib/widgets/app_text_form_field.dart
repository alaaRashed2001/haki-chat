import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final IconData? prefixIcon;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool obscure;
  final FormFieldValidator<String>? validator;

  const AppTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.inputType,
    this.obscure = false,
    this.inputAction,
    this.validator,
    this.prefixIcon,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool showPassword = widget.obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscure && !showPassword,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: Icon(widget.prefixIcon),
        ),
        suffixIcon: widget.obscure
            ? IconButton(
                onPressed: () {
                  setState(() => showPassword = !showPassword);
                },
                icon: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
      keyboardType: widget.inputType,
      textInputAction: widget.inputAction,
    );
  }
}
