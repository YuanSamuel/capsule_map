import 'package:cached_network_image/cached_network_image.dart';
import 'package:capsule_map/models/User.dart';
import 'package:capsule_map/services/database_service.dart';
import 'package:flutter/material.dart';

class FriendWidget extends StatelessWidget {
  final User friend;
  FriendWidget({Key key, this.friend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  friend.profileUrl != null && friend.profileUrl.isNotEmpty
                      ? CachedNetworkImageProvider(friend.profileUrl)
                      : AssetImage('images/pfp.jpeg'),
              radius: 25.0,
            ),
            SizedBox(width: 10),
            Text(
              friend.username,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFF616161),
              ),
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.close_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            DatabaseService.removeFriend(friend, context);
          },
        ),
      ],
    );
  }
}
