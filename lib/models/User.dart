import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String username;
  List<String> capsules;
  List<String> friends;
  List<String> friendCapsules;
  List<String> friendCapsulesOpened;

  DocumentReference reference;

  User(
      {this.username,
      this.capsules,
      this.friends,
      this.friendCapsules,
      this.friendCapsulesOpened});

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    User newUser = User.fromJson(snapshot.data());
    newUser.reference = snapshot.reference;
    return newUser;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    List allCapsules = json['capsules'] as List;
    List<String> capsulesConverted = <String>[];
    allCapsules.forEach((capsule) {
      capsulesConverted.add(capsule as String);
    });

    List allFriends = json['friends'] as List;
    List<String> friendsConverted = <String>[];
    allFriends.forEach((friend) {
      friendsConverted.add(friend as String);
    });

    List allFriendCapsules = json['friendCapsules'] as List;
    List<String> friendCapsulesConverted = <String>[];
    allFriendCapsules.forEach((friendCapsule) {
      friendCapsulesConverted.add(friendCapsule as String);
    });

    List allFriendCapsulesOpened = json['friendCapsulesOpened'] as List;
    List<String> friendCapsulesOpenedConverted = <String>[];
    allFriendCapsulesOpened.forEach((friendCapsuleOpened) {
      friendCapsulesOpenedConverted.add(friendCapsuleOpened as String);
    });

    return User(
      username: json['username'] as String,
      capsules: capsulesConverted,
      friends: friendsConverted,
      friendCapsules: friendCapsulesConverted,
      friendCapsulesOpened: friendCapsulesOpenedConverted,
    );
  }

  Map<String, dynamic> toJson() => _UserToJson(this);

  Map<String, dynamic> _UserToJson(User instance) => <String, dynamic>{
        'username': instance.username,
        'capsules': instance.capsules,
        'friends': instance.friends,
        'friendCapsules': instance.friendCapsules,
        'friendCapsulesOpened': instance.friendCapsulesOpened,
      };
}
