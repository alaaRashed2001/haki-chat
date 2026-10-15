import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haki/core/assets/app_assets.dart';
import 'package:haki/core/colors/app_colors.dart';
import 'package:haki/core/controller/sign_up_controller.dart';
import 'package:haki/core/enums/widget_state_enum.dart';
import 'package:haki/core/extensions/app_responsive.dart';
import 'package:haki/core/extensions/text_style_extension.dart';
import 'package:haki/core/extensions/theme_extension.dart';
import 'package:haki/core/navigations/app_navigation.dart';
import 'package:haki/view/auth/widgets/auth_header_icon.dart';
import 'package:haki/view/auth/widgets/auth_form.dart';
import 'package:haki/widgets/custom_elevated_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late SignUpController signUpController;

  @override
  void initState() {
    super.initState();
    signUpController = SignUpController(context);
  }

  @override
  void dispose() {
    super.dispose();
    signUpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: signUpController.screenStateOutput,
      initialData: WidgetStateEnum.enable,
      builder: (context, snapshot) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: context.spaceHorizontal(16),
              child: Column(
                children: [
                  8.hSpace,
                  const AuthHeaderIcon(image: AppAssets.wave),

                  30.hSpace,

                  Text(
                    "Sign Up",
                    style: context.font34Bold!.copyWith(
                      color: AppColorPalette.primary,
                    ),
                  ),

                  30.hSpace,

                  Text(
                    "Let’s make New Account",
                    style: context.font16Regular!.copyWith(
                      color: context.textSecondaryColor,
                    ),
                  ),

                  60.hSpace,
                  AuthForm(
                    formKey: signUpController.formKey,
                    isLogin: false,
                    nameController: signUpController.nameController,
                    emailController: signUpController.emailController,
                    passwordController: signUpController.passwordController,
                  ),

                  30.hSpace,

                  CustomElevatedButton(
                    text: "Create Account",
                    isLoading: snapshot.data == WidgetStateEnum.loading,
                    onPressed: () => signUpController.onPressedCreateAccount(),
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
                text: "Already have an account?",
                style: TextStyle(
                  color: context.textSecondaryColor,
                  fontSize: 18.sp,
                ),
                children: [
                  TextSpan(
                    text: ' Sign in now',
                    style: const TextStyle(
                      color: AppColorPalette.primary,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => AppNavigation.pop(context: context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
