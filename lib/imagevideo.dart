import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagevideoPage extends StatefulWidget {
  @override
  _ImagevideoPageState createState() => _ImagevideoPageState();
}

class _ImagevideoPageState extends State<ImagevideoPage> {
  File _image = null;

  // ignore: avoid_init_to_null

  final pickle = ImagePicker();

  Future getImage() async {
    final picklerfile = await pickle.getImage(source: ImageSource.camera);

    setState(() {
      // ignore: unnecessary_null_comparison
      if (pickle != null) {
        _image = File(picklerfile.path);
      } else {
        print('Image not found.');
      }
    });
  }

/*PickedFile imageFile;

Future getImage(int type) async {
  PickedFile pickedImage = await ImagePicker().getImage(
      source: type == 1 ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50);
  return pickedImage;
}*/

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Capsule Image Picker'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image was selected. Please try again.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
