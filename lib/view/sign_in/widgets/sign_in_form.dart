import 'package:flutter/material.dart';
import 'package:haki/core/extensions/app_responsive.dart';
import 'package:haki/widgets/app_text_form_field.dart';

class SignInForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: context.rHeight(16),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextFormField(
            controller: emailController,
            hintText: 'test@example.com',
            prefixIcon: Icons.email,
            inputAction: TextInputAction.next,
            inputType: TextInputType.emailAddress,
          ),

          AppTextFormField(
            controller: passwordController,
            hintText: 'xxxxxxxx',
            prefixIcon: Icons.lock,
            inputAction: TextInputAction.next,
            inputType: TextInputType.visiblePassword,
            obscure: true,
          ),
        ],
      ),
    );
  }
}
