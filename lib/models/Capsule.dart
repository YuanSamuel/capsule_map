import 'package:cloud_firestore/cloud_firestore.dart';

class Capsule {
  String username;
  String title;
  String description;
  GeoPoint location;
  List<String> imageUrls;
  List<String> videoUrls;
  DateTime created;

  DocumentReference reference;

  Capsule(
      {this.username,
      this.title,
      this.description,
      this.location,
      this.imageUrls,
      this.videoUrls,
      this.created});

  factory Capsule.fromSnapshot(DocumentSnapshot snapshot) {
    Capsule newCapsule = Capsule.fromJson(snapshot.data());
    newCapsule.reference = snapshot.reference;
    return newCapsule;
  }

  factory Capsule.fromJson(Map<String, dynamic> json) {
    List allImageUrls = json['imageUrls'];
    List<String> imageUrlsConverted = <String>[];
    allImageUrls.forEach((url) {
      imageUrlsConverted.add(url as String);
    });

    List allVideoUrls = json['videoUrls'];
    List<String> videoUrlsConverted = <String>[];
    allVideoUrls.forEach((url) {
      videoUrlsConverted.add(url as String);
    });

    return Capsule(
      username: json['username'],
      title: json['title'],
      description: json['description'],
      location: json['location'] as GeoPoint,
      imageUrls: imageUrlsConverted,
      videoUrls: videoUrlsConverted,
      created: (json['created'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() => _CapsuleToJson(this);

  Map<String, dynamic> _CapsuleToJson(Capsule instance) => <String, dynamic>{
        'username': instance.username,
        'title': instance.title,
        'description': instance.description,
        'location': instance.location,
        'imageUrls': instance.imageUrls,
        'videoUrls': instance.videoUrls,
        'created': DateTime.now(),
      };
}
