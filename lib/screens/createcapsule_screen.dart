import 'dart:math'
    '';
import 'dart:io';

import 'package:capsule_map/models/Capsule.dart';
import 'package:capsule_map/models/User.dart';
import 'package:capsule_map/screens/choose_friends_dialog.dart';
import 'package:capsule_map/services/database_service.dart';
import 'package:capsule_map/services/firebase_storage_service.dart';
import 'package:capsule_map/stores/mainStore/main_store.dart';
import 'package:capsule_map/stores/positionStore/position_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateCapsuleScreen extends StatefulWidget {
  @override
  _CreateCapsuleScreenState createState() => _CreateCapsuleScreenState();
}

class _CreateCapsuleScreenState extends State<CreateCapsuleScreen> {
  TextEditingController _titleInputController;
  TextEditingController _descriptionInputController;

  List<File> _images;
  List<File> _videos;

  bool _loading = false;

  @override
  void initState() {
    _titleInputController = new TextEditingController();
    _descriptionInputController = new TextEditingController();
    _images = <File>[];
    _videos = <File>[];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    MainStore mainStore = Provider.of<MainStore>(context);

    return Observer(
      builder: (_) {
        List<User> friends = mainStore.friendsStore.friends;
        print(friends);
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
                    child: SingleChildScrollView(
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      height: height * 0.06,
                                      width: width * 0.7,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: TextFormField(
                                            controller: _titleInputController,
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
                                    height: height * 0.22,
                                    width: 350.0,
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
                                            height: height * 0.12,
                                            width: width * 0.7,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: TextFormField(
                                                  controller:
                                                      _descriptionInputController,
                                                  maxLines: 100,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                height * 0.005),
                                                    border: InputBorder.none,
                                                    hintText: 'Create a Memo',
                                                    hintStyle: TextStyle(
                                                      fontFamily: 'Open_Sans',
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                  child: GestureDetector(
                                    onTap: () async {
                                      ImageSource imageSource =
                                          await showDialog<ImageSource>(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  height: height * 0.4,
                                                  width: width * 0.8,
                                                  child: SimpleDialog(
                                                    title:
                                                        Text('Choose an Image'),
                                                    children: [
                                                      ListTile(
                                                        leading: Icon(Icons
                                                            .camera_alt_outlined),
                                                        title: Text('Camera'),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context,
                                                              ImageSource
                                                                  .camera);
                                                        },
                                                      ),
                                                      ListTile(
                                                        leading:
                                                            Icon(Icons.photo),
                                                        title: Text('Gallery'),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context,
                                                              ImageSource
                                                                  .gallery);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              });
                                      if (imageSource != null) {
                                        PickedFile image = await ImagePicker()
                                            .getImage(source: imageSource);
                                        if (image != null) {
                                          setState(() {
                                            _images.add(File(image.path));
                                          });
                                        }
                                      }
                                    },
                                    child: Container(
                                      height: 165.0,
                                      width: 165.0,
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue[900]
                                            .withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                            _images.length > 0
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            _images.length
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey[700]),
                                                          ),
                                                          SizedBox(
                                                            width: 10.0,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                : SizedBox.shrink(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    ImageSource imageSource = await showDialog<
                                            ImageSource>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: height * 0.4,
                                            width: width * 0.8,
                                            child: SimpleDialog(
                                              title: Text('Choose an Image'),
                                              children: [
                                                ListTile(
                                                  leading: Icon(Icons
                                                      .camera_alt_outlined),
                                                  title: Text('Camera'),
                                                  onTap: () {
                                                    Navigator.pop(context,
                                                        ImageSource.camera);
                                                  },
                                                ),
                                                ListTile(
                                                  leading: Icon(Icons.photo),
                                                  title: Text('Gallery'),
                                                  onTap: () {
                                                    Navigator.pop(context,
                                                        ImageSource.gallery);
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                    if (imageSource != null) {
                                      PickedFile image = await ImagePicker()
                                          .getVideo(source: imageSource);
                                      if (image != null) {
                                        setState(() {
                                          _images.add(File(image.path));
                                        });
                                      }
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            offset: Offset(0, 2),
                                            blurRadius: 4.0,
                                          ),
                                        ]),
                                    child: Container(
                                      height: 165.0,
                                      width: 165.0,
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue[900]
                                            .withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                              height: height * 0.025,
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
                                            _videos.length > 0
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            _videos.length
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey[700]),
                                                          ),
                                                          SizedBox(
                                                            width: 10.0,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                : SizedBox.shrink(),
                                          ],
                                        ),
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
                          GestureDetector(
                            onTap: () async {
                              setState(() {
                                _loading = true;
                              });

                              List<String> imageUrls =
                                  await FirebaseStorageService.uploadImages(
                                      _images);
                              List<String> videoUrls =
                                  await FirebaseStorageService.uploadVideos(
                                      _videos);

                              PositionStore positionStore =
                                  Provider.of<PositionStore>(context,
                                      listen: false);
                              GeoPoint location;
                              if (positionStore.positionStream != null &&
                                  positionStore.positionStream.value != null) {
                                location = GeoPoint(
                                    positionStore.positionStream.value.latitude,
                                    positionStore
                                        .positionStream.value.longitude);
                              } else {
                                location = GeoPoint(
                                    Random().nextDouble() * 360 - 180,
                                    Random().nextDouble() * 360 - 180);
                              }

                              Capsule newCapsule = new Capsule(
                                title: _titleInputController.text.trim(),
                                description:
                                    _descriptionInputController.text.trim(),
                                location: location,
                                imageUrls: imageUrls,
                                videoUrls: videoUrls,
                              );

                              String id = await DatabaseService.createCapsule(
                                  newCapsule, context);

                              await showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return ChooseFriendsDialog(
                                      capsuleId: id,
                                      friends: friends ?? [],
                                    );
                                  });
                              Navigator.pop(context);
                            },
                            child: !_loading
                                ? Container(
                                    height: height * 0.06,
                                    width: width * 0.6,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.blue[900],
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
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
                                  )
                                : CircularProgressIndicator(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
