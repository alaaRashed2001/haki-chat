import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haki/core/assets/app_assets.dart';
import 'package:haki/core/colors/app_colors.dart';
import 'package:haki/core/controller/sign_in_controller.dart';
import 'package:haki/core/enums/widget_state_enum.dart';
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
  late SignInController signInController;

  @override
  void initState() {
    super.initState();

    signInController = SignInController(context);
  }

  @override
  void dispose() {
    signInController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: signInController.screenStateOutput,
      initialData: WidgetStateEnum.enable,
      builder: (context, asyncSnapshot) {
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
                      formKey: signInController.formKey,
                      isLogin: true,
                      emailController: signInController.emailController,
                      passwordController: signInController.passwordController,
                    ),

                    30.hSpace,

                    CustomElevatedButton(
                      text: "Sign In",
                      isLoading: asyncSnapshot.data == WidgetStateEnum.loading,
                      onPressed: () => signInController.onPressedSignIn(),
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
      },
    );
  }
}
