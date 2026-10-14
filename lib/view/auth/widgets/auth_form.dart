import 'package:flutter/material.dart';
import 'package:haki/core/extensions/app_responsive.dart';
import 'package:haki/widgets/app_text_form_field.dart';

class AuthForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool isLogin;
  final TextEditingController? nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const AuthForm({
    super.key,
    required this.formKey,
    this.isLogin = false,
    this.nameController,
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
          if (!isLogin && nameController != null)
            AppTextFormField(
              controller: nameController!,
              hintText: 'Your Full Name',
              prefixIcon: Icons.person,
              inputAction: TextInputAction.next,
              inputType: TextInputType.name,
            ),
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
            inputAction: TextInputAction.done,
            inputType: TextInputType.visiblePassword,
            obscure: true,
          ),
        ],
      ),
    );
  }
}
