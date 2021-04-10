import 'package:cloud_firestore/cloud_firestore.dart';

class Capsule {
  String username;
  String title;
  String description;
  GeoPoint location;
  DateTime created;

  DocumentReference reference;

  Capsule(
      {this.username,
      this.title,
      this.description,
      this.location,
      this.created});

  factory Capsule.fromSnapshot(DocumentSnapshot snapshot) {
    Capsule newCapsule = Capsule.fromJson(snapshot.data());
    newCapsule.reference = snapshot.reference;
    return newCapsule;
  }

  factory Capsule.fromJson(Map<String, dynamic> json) {
    return Capsule(
      username: json['username'],
      title: json['title'],
      description: json['description'],
      location: json['location'] as GeoPoint,
      created: (json['created'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() => _CapsuleToJson(this);

  Map<String, dynamic> _CapsuleToJson(Capsule instance) => <String, dynamic>{
        'username': instance.username,
        'title': instance.title,
        'description': instance.description,
        'location': instance.location,
        'created': DateTime.now(),
      };
}
