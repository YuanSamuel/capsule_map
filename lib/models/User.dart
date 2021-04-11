import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String username;
  List<String> capsules;
  List<String> friends;
  List<String> friendCapsules;
  List<String> friendCapsulesOpened;
  List<String> friendRequests;

  DocumentReference reference;

  User(
      {this.username,
      this.capsules,
      this.friends,
      this.friendCapsules,
      this.friendCapsulesOpened,
      this.friendRequests});

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

    List allFriendRequests = json['friendRequests'] as List;
    List<String> friendRequestsConverted = <String>[];
    allFriendRequests.forEach((friendRequest) {
      friendRequestsConverted.add(friendRequest as String);
    });

    return User(
      username: json['username'] as String,
      capsules: capsulesConverted,
      friends: friendsConverted,
      friendCapsules: friendCapsulesConverted,
      friendCapsulesOpened: friendCapsulesOpenedConverted,
      friendRequests: friendRequestsConverted,
    );
  }

  Map<String, dynamic> toJson() => _UserToJson(this);

  Map<String, dynamic> _UserToJson(User instance) => <String, dynamic>{
        'username': instance.username,
        'capsules': instance.capsules,
        'friends': instance.friends,
        'friendCapsules': instance.friendCapsules,
        'friendCapsulesOpened': instance.friendCapsulesOpened,
        'friendRequests': instance.friendRequests,
      };
}
