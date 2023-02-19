import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/model/posts.dart';
import 'package:instagram_clone/resources/storage_method.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // upload post
  Future<String> uploadPost(
      String description,
      Uint8List file,
      String uid,
      String username,
      String profImage,
      ) async {
    String res = "Error occurred";
      try{
        String photoUrl = await StorageMethods().uploadImageToStorage("posts", file, true);
        String postId = const Uuid().v1();
        Post post = Post(
            description: description,
            uid: uid,
            username: username,
            likes: [],
            postId:postId ,
            datePublished: DateTime.now(),
            postUrl: photoUrl,
            profImage: profImage
        );
        _firestore.collection('posts').doc(postId).set(post.toJson());
        res = 'Success';
      }
      catch(e){
          res = e.toString();
          }
          return res;
  }


}
