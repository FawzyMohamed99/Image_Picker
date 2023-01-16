import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GetImageInGallary extends StatefulWidget {
  const GetImageInGallary({Key? key}) : super(key: key);

  @override
  State<GetImageInGallary> createState() => _GetImageInGallaryState();
}

class _GetImageInGallaryState extends State<GetImageInGallary> {
   File ? image;
  final imagepicker = ImagePicker();

  Future uploadImage() async {
    var pickedimage = await imagepicker.getImage(source: ImageSource.camera);

    if (pickedimage != null) {
      setState(() {
        image = File(pickedimage.path);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image in Camera or Gallary'),
      ),
      body: Column(
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: uploadImage, child: Text("upload image"))),
          image == null ? Text('not choose image') : Image.file(image!),
        ],
      ),
    );
  }
}
