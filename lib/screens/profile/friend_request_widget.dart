import 'package:cached_network_image/cached_network_image.dart';
import 'package:capsule_map/models/User.dart';
import 'package:capsule_map/services/database_service.dart';
import 'package:flutter/material.dart';

class FriendRequestWidget extends StatelessWidget {
  final User friendRequest;
  FriendRequestWidget({Key key, this.friendRequest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: friendRequest.profileUrl != null &&
                      friendRequest.profileUrl.isNotEmpty
                  ? CachedNetworkImageProvider(friendRequest.profileUrl)
                  : AssetImage('images/pfp.jpeg'),
              radius: 25.0,
            ),
            SizedBox(width: 10),
            Text(
              friendRequest.username,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFF616161),
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.black,
              ),
              onPressed: () {
                DatabaseService.acceptFriendRequest(friendRequest, context);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.close_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                DatabaseService.declineFriendRequest(friendRequest, context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
