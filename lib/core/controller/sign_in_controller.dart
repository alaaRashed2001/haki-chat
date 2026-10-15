import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:haki/core/enums/widget_state_enum.dart';
import 'package:haki/core/extensions/get_it_extensions.dart';
import 'package:haki/core/extensions/text_editing_controller_extensions.dart';
import 'package:haki/core/navigations/app_navigation.dart';
import 'package:haki/core/navigations/routes_manager.dart';
import 'package:haki/core/service/get_it_service.dart';
import 'package:haki/widgets/app_snack_bar.dart';

class SignInController {
  final BuildContext context;
  WidgetStateEnum screenState = WidgetStateEnum.enable;

  late GlobalKey<FormState> formKey;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  SignInController(this.context) {
    _init();
  }

  late StreamController<WidgetStateEnum> _screenStateController;
  late Stream<WidgetStateEnum> screenStateOutput;
  late Sink<WidgetStateEnum> _screenStateInput;

  void _init() {
    _initControllers();
    _initFormKey();
    _initStreams();
  }

  void _initStreams() {
    _initScreenStateStreams();
  }


  void _initScreenStateStreams() {
    _screenStateController = StreamController<WidgetStateEnum>();
    screenStateOutput = _screenStateController.stream.asBroadcastStream();
    _screenStateInput = _screenStateController.sink;
  }

  void _disposeStreams() {
    _disposeScreenStateStreams();
  }



  void _disposeScreenStateStreams() {
    _screenStateController.close();
    _screenStateInput.close();
  }

  void _initFormKey() {
    formKey = GlobalKey<FormState>();
  }

  void _initControllers() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void dispose() {
    _disposeControllers();
    _disposeFormKey();
    _disposeStreams();
  }

  void _disposeFormKey() {
    formKey.currentState?.dispose();
  }

  void _disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }


  void onPressedSignIn() async {
    if (formKey.currentState!.validate()) {
      _signIn();
    }
  }

  void _signIn() async {
    _changeScreenState(WidgetStateEnum.loading);
    Either<String, UserCredential> result = await getIt
        .signInUserWithEmailAndPassword(
      emailAddress: emailController.getText,
      password: passwordController.getText,
    );
    result.fold(_onFailureSignIn, _onSuccessSignIn);
  }

  void _onFailureSignIn(String l) {
    _changeScreenState(WidgetStateEnum.failed);
    showAppSnackBar(context: context, message: l);
  }

  void _onSuccessSignIn(UserCredential r) async {
    _changeScreenState(WidgetStateEnum.success);
    _goToMessagePage();
  }

  void _goToMessagePage() {
    if (context.mounted) {
      AppNavigation.pushNamedAndRemoveUntil(
        context: context,
        routeName: RouteName.messagesPage,
      );
    }
  }

  void _changeScreenState(WidgetStateEnum state) {
    _screenStateInput.add(state);
  }






}

