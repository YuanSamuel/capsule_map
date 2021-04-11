import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  static FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  static Future<List<String>> uploadImages(List<File> images) async {
    DateTime now = DateTime.now();
    List<Future<TaskSnapshot>> futureUploads = <Future<TaskSnapshot>>[];
    for (int i = 0; i < images.length; i++) {
      futureUploads.add(_firebaseStorage
          .ref('capsuleImages')
          .child(FirebaseAuth.instance.currentUser.uid)
          .child(now.toString() + ' ' + i.toString())
          .putFile(images[i])
          .catchError((error) => print(error)));
    }
    List<TaskSnapshot> tasks = await Future.wait(futureUploads);

    List<Future<String>> futureDownloadUrls = <Future<String>>[];
    tasks.forEach((TaskSnapshot task) {
      futureDownloadUrls.add(task.ref.getDownloadURL());
    });

    List<String> downloadUrls = await Future.wait(futureDownloadUrls);
    return downloadUrls;
  }

  static Future<List<String>> uploadVideos(List<File> images) async {
    DateTime now = DateTime.now();
    List<Future<TaskSnapshot>> futureUploads = <Future<TaskSnapshot>>[];
    for (int i = 0; i < images.length; i++) {
      futureUploads.add(_firebaseStorage
          .ref('capsuleVideos')
          .child(FirebaseAuth.instance.currentUser.uid)
          .child(now.toString() + ' ' + i.toString())
          .putFile(images[i])
          .catchError((error) => print(error)));
    }
    List<TaskSnapshot> tasks = await Future.wait(futureUploads);

    List<Future<String>> futureDownloadUrls = <Future<String>>[];
    tasks.forEach((TaskSnapshot task) {
      futureDownloadUrls.add(task.ref.getDownloadURL());
    });

    List<String> downloadUrls = await Future.wait(futureDownloadUrls);
    return downloadUrls;
  }

  static Future<String> uploadProfileUrl(File image) async {
    DateTime now = DateTime.now();

    TaskSnapshot snapshot = await _firebaseStorage
        .ref('profileImages')
        .child(FirebaseAuth.instance.currentUser.uid)
        .child(now.toString())
        .putFile(image)
        .catchError((error) => print(error));

    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
