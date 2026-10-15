import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:haki/core/constants/consts_manager.dart';

class FirebaseServiceManager {
  const FirebaseServiceManager._();

  // Create User With Email And Password Service Manager
  static Future<Either<String, UserCredential>> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const Left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return const Left('The account already exists for that email.');
      } else {
        return Left(e.toString());
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  // Add Email And Name Service Manager
  static Future<bool> addEmailAndName({
    required String emailAddress,
    required String name,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
            'email': emailAddress,
            'name': name,
            "createdAt": DateTime.now(),
          });
      return true;
    } catch (e) {
      return false;
    }
  }

  // Sign In User With Email And Password Service Manager
  static Future<Either<String, UserCredential>> signInUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'user-not-found') {
        return const Left('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return const Left('Wrong password provided for that user.');
      } else {
        return const Left("Wrong email or password");
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  // Sign In With Google Service Manager
  static Future<String?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;

    try {
      await googleSignIn.initialize();
      final List<String> scope = ['email'];

      final GoogleSignInAccount auth = await googleSignIn.authenticate(
        scopeHint: scope,
      );
      final GoogleSignInAuthorizationClient authClient =
          auth.authorizationClient;
      var authorization = await authClient.authorizationForScopes(scope);

      authorization ??= await authClient.authorizeScopes(scope);
      var googleAuth = auth.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      return authorization.accessToken;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static String _generateRawNonce() {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    final random = Random.secure();
    return List.generate(
      16,
      (index) => charset[random.nextInt(charset.length)],
    ).join();
  }

  static String _sha256Convert(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  static Future<({String? token, String message})> signInWithFacebook() async {
    try {
      final String rawNonce = _generateRawNonce();
      final String hashedNonce = _sha256Convert(rawNonce);

      // 2. تمرير الـ hashedNonce لفيسبوك (مهم جداً للـ Limited Login)
      final LoginResult loginResult = await FacebookAuth.instance.login(
        nonce: Platform.isAndroid ? null : hashedNonce,
      );
      print("loginResult ${loginResult.status}");
      switch (loginResult.status) {
        case LoginStatus.cancelled:
          return (token: null, message: ConstsManager.userCancelled);
        case LoginStatus.failed:
          return (token: null, message: ConstsManager.signInFacebookFailed);
        case LoginStatus.operationInProgress:
          return (token: null, message: ConstsManager.signInFacebookInProgress);
        case LoginStatus.success:
          // Create userCredential credential from the access token
          if (Platform.isAndroid) {
            final OAuthCredential facebookAuthCredential =
                FacebookAuthProvider.credential(
                  loginResult.accessToken!.tokenString,
                );

            // Once signed in, return the UserCredential
            UserCredential userCredential = await FirebaseAuth.instance
                .signInWithCredential(facebookAuthCredential);
            print("UserCredential is $userCredential");
            return (
              token: userCredential.credential?.accessToken,
              message: ConstsManager.signInFacebookSuccess,
            );
          } else {
            final String token = loginResult.accessToken!.tokenString;
            print("Token: $token");

            // 3. بناء الـ Credential باستخدام idToken والـ rawNonce
            final OAuthCredential credential = FacebookAuthProvider.credential(
              token, // هنا نمرر الـ ID Token (الذي يبدأ بـ eyJ)
            );
            print(credential.idToken);
            print(credential.accessToken);
            // في حالات الـ Limited Login المعقدة، نستخدم التمرير اليدوي للتأكد من الـ Nonce
            UserCredential userCredential = await FirebaseAuth.instance
                .signInWithCredential(
                  OAuthCredential(
                    providerId: 'facebook.com',
                    signInMethod: 'oauth',
                    idToken: token,
                    rawNonce: rawNonce, // نمرر النص الأصلي غير المشفر هنا
                  ),
                );
            String? firebaseIdToken = await userCredential.user?.getIdToken();

            return (
              token: firebaseIdToken,
              message: ConstsManager.signInFacebookSuccess,
            );
          }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        return (
          token: null,
          message: ConstsManager.accountExistsWithDifferentCredential,
        );
      } else if (e.code == 'invalid-credential') {
        return (token: null, message: ConstsManager.invalidCredential);
      }
      return (token: null, message: ConstsManager.unexpectedError);
    } catch (e) {
      print("EX:  $e");

      return (token: null, message: ConstsManager.unexpectedError);
    }
  }
}

