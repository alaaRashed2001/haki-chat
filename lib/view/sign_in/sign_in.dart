import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haki/core/assets/app_assets.dart';
import 'package:haki/core/colors/app_colors.dart';
import 'package:haki/core/extensions/app_responsive.dart';
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
          padding: context.spaceHorizontal(16),
          child: Column(
            children: [
              8.hSpace,

              Container(
                padding: context.spaceAll(10),
                decoration: BoxDecoration(
                  color: AppColorPalette.primary,
                  borderRadius: context.circularRadius(26),
                ),
                child: Image.asset(AppAssets.claps),
              ),

              30.hSpace,

              Text(
                "Sign In",
                style: context.font34Bold!.copyWith(
                  color: AppColorPalette.primary,
                ),
              ),

              30.hSpace,

              Text(
                "Let’s go To discover App",
                style: context.font16Regular!.copyWith(
                  color: context.textSecondaryColor,
                ),
              ),

              60.hSpace,

              SignInForm(
                formKey: _formKey,
                emailController: emailController,
                passwordController: passwordController,
              ),

              30.hSpace,

              CustomElevatedButton(
                text: "Sign In",
                onPressed: () {},
              ),

              30.hSpace,

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

              30.hSpace,

              Row(
                children: [
                  Expanded(
                    child: SocialButton(
                      title: "Google",
                      image: AppAssets.google,
                      onTap: () {},
                    ),
                  ),
                  16.wSpace,
                  Expanded(
                    child: SocialButton(
                      title: "Facebook",
                      image: AppAssets.facebook,
                      onTap: () {},
                    ),
                  ),
                ],
              ),

              const Spacer(),

              RichText(
                text: TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(
                    color: context.textSecondaryColor,
                    fontSize: 18.sp,
                  ),
                  children: [
                    TextSpan(
                      text: ' Sign up',
                      style: const TextStyle(
                        color: AppColorPalette.primary,
                        fontSize: 18,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigate to Sign up screen
                        },
                    ),
                  ],
                ),
              ),

              30.hSpace,
            ],
          ),
        ),
      ),
    );
  }
}
