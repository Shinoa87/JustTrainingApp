import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../../models/user_model/user_model.dart';
import 'base_auth_repository.dart';

 class AuthRepository extends BaseAuthRepository{
   final auth.FirebaseAuth _firebaseAuth;
   final FirebaseFirestore _firebaseFirestore;
   
   AuthRepository({auth.FirebaseAuth? firebaseAuth,FirebaseFirestore? firebaseFirestore})
       : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance,
         _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<auth.User?> signUp({
    required String email,
    required String password,
    required String username,
  }) async{

    final userToMap = UserModel(
        password: password,
        email: email,
        username: username,
    ).toMap();

    try{
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      await _firebaseFirestore
          .collection('users')
          .doc(user?.uid)
          .set(userToMap);

      return user;
    } catch (_){}
  }

   @override
   Future<auth.User?> signIn({
     required String email,
     required String password,
   }) async{
     try{
       final credential = await _firebaseAuth.signInWithEmailAndPassword(
         email: email,
         password: password,
       );

       final user = credential.user;
       return user;
     } catch (_){}
   }

   @override
   Future<void> resetPassword({
     required String email,
   }) async{
     try{
       await _firebaseAuth.sendPasswordResetEmail(
         email: email,
       );
     } catch (_){}
   }

   @override
   Future<void> signOut() async{
    await _firebaseAuth.signOut();
   }

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();
 }