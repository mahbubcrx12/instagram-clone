import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_method.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore =FirebaseFirestore.instance;

  // sign up user
  Future <String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  })async{
    String res = "Some error occurred";
    try{
      if(email.isNotEmpty || password.isNotEmpty ||
          username.isNotEmpty || bio.isNotEmpty){
        //register user
       UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

       String photoUrl = await StorageMethods().uploadImageToStorage("profilePics", file, false);

       //add user to user database
        await _firestore.collection("users").doc(cred.user!.uid).set({
          'username': username,
          'uid' : cred.user!.uid,
          'email' : email,
          'bio' : bio,
          'followers' : [],
          'following' : [],
          'photoUrl' : photoUrl,
        });
        res = "Success";
      }
    } on FirebaseAuthException catch(err){
      if(err.code == 'invalid-email'){
        res='The email is badly formatted.';
      }
      else if (err.code == 'weak-password'){
        res = "Password should be at least 6 characters";
      }
    }
        catch(e){
         res = e.toString();
        }
        return res;

}

//Logging in user
Future<String> loginUser({required String email,required String password})async{
    String res = 'Some error occurred';

    try{
      if(email.isNotEmpty || password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = 'Success';
      }else{
        res = 'Please enter all the field';
      }
    }catch(err){
      res = err.toString();
    }
    return res;
}

}