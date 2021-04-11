import 'package:capsule_map/models/Capsule.dart';
import 'package:capsule_map/utils/StringHelper.dart';
import 'package:flutter/material.dart';

class CapsuleWidget extends StatelessWidget {
  final Capsule capsule;
  CapsuleWidget({Key key, this.capsule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return Container(
              height: height * 0.7,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: Colors.white),
                child: Column(
                  children: [
                  SizedBox(
                  height: 20.0,),
                    Text(capsule.title,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,)),
                SizedBox(
                  height: 3.0,),
                    Text(capsule.username +
                        ' - ' +
                        StringHelper.dateToString(capsule.created), style: TextStyle(
                        fontStyle: FontStyle.italic)),
                    Divider(
                      height:25
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30.0, right:30),
                      child:
                    Text(capsule.description, style: TextStyle(
                      fontSize: 16.0,
                        height: 1.5)),),
                    SizedBox(
                      height: 4.0,),


                  ],
                ),

              ),
            );
          },
        );
      },
      child: Container(
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
                  Text(capsule.username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      )),
                  Text(
                    StringHelper.dateToString(
                      capsule.created,
                    ),
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 15.0,
                    ),
                  )
                ],
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
      ),
    );
  }
}
