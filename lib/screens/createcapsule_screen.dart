import 'package:flutter/material.dart';

class CreateCapsuleScreen extends StatefulWidget {
  @override
  _CreateCapsuleScreenState createState() => _CreateCapsuleScreenState();
}

class _CreateCapsuleScreenState extends State<CreateCapsuleScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: Column(
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios_rounded),
                          ),
                        ),
                        Text(
                          'Create a Capsule',
                          style: TextStyle(
                            fontFamily: 'Open_Sans',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20.0, top: 50.0),
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage('images/dog.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0, 2),
                              blurRadius: 4.0,
                            ),
                          ]),
                      child: Container(
                        height: 150.0,
                        width: 350.0,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[300].withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                          child: Column(
                            children: [
                              Text(
                                'Add Title',
                                style: TextStyle(
                                  fontFamily: 'Open_Sans',
                                  fontSize: 25.0,
                                  color: Colors.blueGrey[700],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.025,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffF8F8F8),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                height: height * 0.06,
                                width: width * 0.7,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Create a Title',
                                        hintStyle: TextStyle(
                                          fontFamily: 'Open_Sans',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffbfbfbf),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // ______________________________________
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    offset: Offset(0, 2),
                                    blurRadius: 4.0,
                                  ),
                                ]),
                            child: Container(
                              height: 165.0,
                              width: 165.0,
                              decoration: BoxDecoration(
                                color: Colors.teal[200].withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 15.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Memo',
                                      style: TextStyle(
                                        fontFamily: 'Open_Sans',
                                        fontSize: 25.0,
                                        color: Colors.blueGrey[700],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.025,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffF8F8F8),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      height: height * 0.06,
                                      width: width * 0.7,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Create a Memo',
                                              hintStyle: TextStyle(
                                                fontFamily: 'Open_Sans',
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xffbfbfbf),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    offset: Offset(0, 2),
                                    blurRadius: 4.0,
                                  ),
                                ]),
                            child: Container(
                              height: 165.0,
                              width: 165.0,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue[900].withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 15.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Photo',
                                      style: TextStyle(
                                        fontFamily: 'Open_Sans',
                                        fontSize: 25.0,
                                        color: Colors.blueGrey[700],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.025,
                                    ),
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        size: 40.0,
                                        color: Colors.blueGrey[300],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    offset: Offset(0, 2),
                                    blurRadius: 4.0,
                                  ),
                                ]),
                            child: Container(
                              height: 165.0,
                              width: 165.0,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue[900].withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 15.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Video',
                                      style: TextStyle(
                                        fontFamily: 'Open_Sans',
                                        fontSize: 25.0,
                                        color: Colors.blueGrey[700],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.04,
                                    ),
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      child: Icon(
                                        Icons.voice_chat_outlined,
                                        size: 40.0,
                                        color: Colors.blueGrey[300],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    offset: Offset(0, 2),
                                    blurRadius: 4.0,
                                  ),
                                ]),
                            child: Container(
                              height: 165.0,
                              width: 165.0,
                              decoration: BoxDecoration(
                                color: Colors.teal[200].withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 15.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 30.0),
                                      child: Text(
                                        'Voice Memo',
                                        style: TextStyle(
                                          fontFamily: 'Open_Sans',
                                          fontSize: 25.0,
                                          color: Colors.blueGrey[700],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      child: Icon(
                                        Icons.keyboard_voice_outlined,
                                        size: 40.0,
                                        color: Colors.blueGrey[300],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Container(
                      height: height * 0.06,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.blue[900],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0, 2),
                              blurRadius: 4.0,
                            ),
                          ]),
                      child: Center(
                        child: Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
