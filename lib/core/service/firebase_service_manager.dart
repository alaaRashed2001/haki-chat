import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServiceManager {
  const FirebaseServiceManager._();

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
}
