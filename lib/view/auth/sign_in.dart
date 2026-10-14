import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haki/core/assets/app_assets.dart';
import 'package:haki/core/colors/app_colors.dart';
import 'package:haki/core/extensions/app_responsive.dart';
import 'package:haki/core/extensions/text_style_extension.dart';
import 'package:haki/core/extensions/theme_extension.dart';
import 'package:haki/core/navigations/app_navigation.dart';
import 'package:haki/core/navigations/routes_manager.dart';
import 'package:haki/view/auth/widgets/auth_header_icon.dart';
import 'package:haki/view/auth/widgets/auth_form.dart';
import 'package:haki/view/auth/widgets/social_button.dart';
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
        child: SingleChildScrollView(
          child: Padding(
            padding: context.spaceHorizontal(16),
            child: Column(
              children: [
                8.hSpace,
                const AuthHeaderIcon(image: AppAssets.claps),

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

                AuthForm(
                  formKey: _formKey,
                  isLogin: true,
                  emailController: emailController,
                  passwordController: passwordController,
                ),

                30.hSpace,

                CustomElevatedButton(text: "Sign In", onPressed: () {}),

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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        maintainBottomViewPadding: true,
        child: Padding(
          padding: context.spaceBottom(30),
          child: RichText(
            textAlign: TextAlign.center,

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
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      AppNavigation.pushNamed(
                        context: context,
                        routeName: RouteName.signUp,
                      );
                    },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
