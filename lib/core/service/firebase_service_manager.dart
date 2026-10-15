import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
}
