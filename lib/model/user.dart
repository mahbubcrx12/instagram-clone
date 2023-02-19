import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String userName;
  final String bio;
  final  List followers;
  final List following;

  const User({
    required this.email,
    required this.uid,
    required this.userName,
    required this.photoUrl,
    required this.bio,
    required this.followers,
    required this.following,
});

  Map<String,dynamic> toJson() => {
    "username" : userName,
    "uid" : uid,
    "email" : email,
    "photoUrl" : photoUrl,
    "bio" : bio,
    "followers" : followers,
    "following" : following
  };

  static User fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String,dynamic>;
    return User(
        email: snapshot['email'],
        uid: snapshot["uid"],
        userName: snapshot["username"],
        photoUrl: snapshot["photoUrl"],
        bio: snapshot["bio"],
        followers: snapshot["followers"],
        following: snapshot["following"]
    );
  }
}