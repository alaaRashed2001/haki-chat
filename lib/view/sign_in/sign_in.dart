import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haki/core/assets/app_assets.dart';
import 'package:haki/core/colors/app_colors.dart';
import 'package:haki/core/extensions/text_style_extension.dart';
import 'package:haki/core/extensions/theme_extension.dart';
import 'package:haki/view/sign_in/widgets/sign_in_form.dart';
import 'package:haki/view/sign_in/widgets/social_button.dart';
import 'package:haki/widgets/custom_elevated_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColorPalette.primary,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Image.asset(AppAssets.claps),
              ),
              SizedBox(height: 30),
              Text(
                "Sign In",
                style: context.font34Bold!.copyWith(
                  color: AppColorPalette.primary,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Let’s go To discover App",
                style: context.font16Regular!.copyWith(
                  color: context.textSecondaryColor,
                ),
              ),
              SizedBox(height: 60),
              SignInForm(
                formKey: _formKey,
                emailController: emailController,
                passwordController: passwordController,
              ),
              SizedBox(height: 30),
              CustomElevatedButton(text: "Sign In", onPressed: () {}),
              SizedBox(height: 30),
              Row(
                spacing: 16,
                children: [
                  const Expanded(child: Divider()),
                  Text(
                    "Or",
                    style: context.font16Regular!.copyWith(
                      color: AppColorPalette.primary,
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),

              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: SocialButton(
                      title: "Google",
                      image: AppAssets.google,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: SocialButton(
                      title: "Facebook",
                      image: AppAssets.facebook,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              Spacer(),
              RichText(
                text: TextSpan(
                  text: 'Don\'t have an account?',
                  style: TextStyle(
                    color: context.textSecondaryColor,
                    fontSize: 18,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Sign up',
                      style: TextStyle(
                        color: AppColorPalette.primary,
                        fontSize: 18,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // navigate to Sign up screen
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
