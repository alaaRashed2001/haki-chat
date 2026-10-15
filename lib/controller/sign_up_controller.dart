import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:haki/core/enums/widget_state_enum.dart';
import 'package:haki/core/extensions/get_it_extensions.dart';
import 'package:haki/core/extensions/text_editing_controller_extensions.dart';
import 'package:haki/core/navigations/app_navigation.dart';
import 'package:haki/core/service/get_it_service.dart';
import 'package:haki/widgets/app_snack_bar.dart';

class SignUpController {
  late TextEditingController nameController;
  final BuildContext context;
  WidgetStateEnum screenState = WidgetStateEnum.enable;

  late GlobalKey<FormState> formKey;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late StreamController<WidgetStateEnum> _screenStateController;
  late Stream<WidgetStateEnum> screenStateOutput;
  late Sink<WidgetStateEnum> _screenStateInput;
  SignUpController(this.context) {
    _init();
  }

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
    nameController = TextEditingController();
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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onPressedCreateAccount() async {
    if (formKey.currentState!.validate()) {
      //
      _createAccount();
    }
  }

  void _createAccount() async {
    _changeScreenState(WidgetStateEnum.loading);
    Either<String, UserCredential> result = await getIt
        .createUserWithEmailAndPassword(
          emailAddress: emailController.getText,
          password: passwordController.getText,
        );
    result.fold(_onFailureCreateAccount, _onSuccessCreateAccount);
  }

  void _onFailureCreateAccount(String l) {
    _changeScreenState(WidgetStateEnum.failed);
    showAppSnackBar(context: context, message: l);
  }

  void _onSuccessCreateAccount(UserCredential r) async {
    var result = await getIt.addEmailAndName(
      emailAddress: emailController.text,
      name: nameController.text,
    );
    if (result) {
      _changeScreenState(WidgetStateEnum.success);
      _goToMessagePage();
    } else {
      _changeScreenState(WidgetStateEnum.failed);
    }
  }

  void _goToMessagePage() {
    if (context.mounted) {
      AppNavigation.pop(context: context);
    }
  }

  void _changeScreenState(WidgetStateEnum state) {
    screenState = state;
    _screenStateInput.add(state);
  }
}
