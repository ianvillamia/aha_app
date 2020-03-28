import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageResult {
  final String imageUrl;
  final String imageFileName;
  CloudStorageResult({this.imageUrl, this.imageFileName});
}

class ImageCapture extends StatefulWidget {
  ImageCapture({Key key}) : super(key: key);

  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    uploadImage(image: image, title: 'patata');
    setState(() {
      _image = image;
    });
  }
  void reset(){
    setState(() {
   _image=null;
    });
  }

  Future<CloudStorageResult> uploadImage({
  @required File image, 
  @required String title}) async {
   
    var imageFileName =
        title + DateTime.now().millisecondsSinceEpoch.toString();
    
    final StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(imageFileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);
    StorageTaskSnapshot storageSnapshot = await uploadTask.onComplete;
    var downloadUrl = await storageSnapshot.ref.getDownloadURL();
    if(uploadTask.isComplete){
      var url = downloadUrl.toString();
      return CloudStorageResult(imageUrl: url,imageFileName: imageFileName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      actions: <Widget>[
        MaterialButton(onPressed: ()=>reset,child:Text('Reset'))
      ],
      ),
      body: Center(
        child: _image == null ? Text('No image selected.') : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
