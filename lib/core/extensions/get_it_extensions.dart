import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:haki/core/service/firebase_service_manager.dart';
import 'package:haki/core/service/get_it_service.dart';

extension GetItExtensions on GetIt {
  // Navigator Key
  GlobalKey<NavigatorState> get navigatorKey =>
      getIt.get<GlobalKey<NavigatorState>>();

  // Create User With Email And Password Service Manager
  Future<Either<String, UserCredential>> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) => FirebaseServiceManager.createUserWithEmailAndPassword(
    emailAddress: emailAddress,
    password: password,
  );


  Future<bool> addEmailAndName({
    required String emailAddress,
    required String name,
  }) => FirebaseServiceManager.addEmailAndName(
    emailAddress: emailAddress,
    name: name,
  );
}
