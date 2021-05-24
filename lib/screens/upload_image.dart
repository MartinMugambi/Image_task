import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math' as math;
import 'package:image_picker/image_picker.dart'; // make sure to import this file

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
// We need first to import 2 plugins to upload the image
// 1st plugin is Path Provider to find the path of files
// 2nd plugin is image picker that enables to pick images from camera and gallery
// These plugins can be found on the pubspec.yaml file

//creating a new object
  File _image;
  //instances of the imagepicker object
  final imagePicker = ImagePicker();

  //function to get image from gallery
  Future getGalleryImage() async {
    final image = await imagePicker.getImage(
        source: ImageSource.gallery); // gets image from Gallery
    setState(() {
      _image = File(image.path);
    });
  }

  // function to get image from Camera
  Future getCameraImage() async {
    final image = await imagePicker.getImage(
        source: ImageSource.camera); // gets image from Gallery
    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Image',
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            (_image == null)
                ? Placeholder(
                    fallbackHeight: 180,
                    fallbackWidth: MediaQuery.of(context).size.width,
                  )
                : Image.file(_image),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    getGalleryImage();
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          size: 40,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Gallery',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    getCameraImage();
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          size: 40,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Transform.rotate(
                      angle: math.pi / 12,
                      child: Icon(
                        Icons.lightbulb_outline,
                        color: Colors.amber,
                        size: 35,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tip!',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Try to upload pictures of any page or table of contents for better chances of selling!',
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                          ),
                          maxLines: 4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                child: FlatButton(
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins-Regular',
                        fontSize: 17.0,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
