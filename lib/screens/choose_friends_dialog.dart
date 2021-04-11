import 'package:capsule_map/models/User.dart';
import 'package:capsule_map/services/database_service.dart';
import 'package:capsule_map/stores/mainStore/main_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChooseFriendsDialog extends StatefulWidget {
  final String capsuleId;
  final List<User> friends;
  ChooseFriendsDialog({Key key, this.capsuleId, this.friends})
      : super(key: key);

  @override
  _ChooseFriendsDialogState createState() => _ChooseFriendsDialogState();
}

class _ChooseFriendsDialogState extends State<ChooseFriendsDialog> {
  List<bool> _selected;

  @override
  void initState() {
    _selected = <bool>[];
    if (widget.friends != null && widget.friends.isNotEmpty) {
      widget.friends.forEach((friend) {
        _selected.add(false);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<Widget> listWidgets = <Widget>[];
    print(widget.friends);

    if (widget.friends != null && widget.friends.isNotEmpty) {
      for (int i = 0; i < widget.friends.length; i++) {
        listWidgets.add(
          ListTile(
            title: Text(widget.friends[i].username),
            onTap: () {
              setState(() {
                _selected[i] = !_selected[i];
              });
            },
            trailing: _selected[i] ? Icon(Icons.check) : SizedBox.shrink(),
          ),
        );
      }
    } else {
      listWidgets.add(Text(
        'No Friends to Select',
        textAlign: TextAlign.center,
      ));
    }

    listWidgets.add(TextButton(
      onPressed: () async {
        List<String> friendIds = <String>[];
        for (int i = 0; i < _selected.length; i++) {
          if (_selected[i]) {
            friendIds.add(widget.friends[i].reference.id);
          }
        }
        if (friendIds.isNotEmpty) {
          await DatabaseService.shareCapsule(widget.capsuleId, friendIds);
        }
        Navigator.pop(context);
      },
      child: Text('Share'),
    ));

    return Container(
      height: height * 0.6,
      width: width * 0.8,
      child: SimpleDialog(
        title: Center(child: Text('Share With')),
        children: listWidgets,
      ),
    );
  }
}
