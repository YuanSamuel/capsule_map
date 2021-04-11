import 'package:capsule_map/models/Capsule.dart';
import 'package:capsule_map/utils/StringHelper.dart';
import 'package:flutter/material.dart';

class CapsuleWidget extends StatelessWidget {
  final Capsule capsule;
  CapsuleWidget({Key key, this.capsule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal[100],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  capsule.username,
                    style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 18.0,)


                ),
                Text(
                  StringHelper.dateToString(capsule.created,
                  ),
                    style: TextStyle(fontStyle: FontStyle.italic,
                    fontSize: 15.0,
                ),
                )],
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              capsule.description,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Address Goes Here',
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
