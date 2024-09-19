import 'dart:convert';
import 'dart:math';

import 'package:durbarclub/Core/appData.dart';
import 'package:durbarclub/Presentation/AllScreen/Notification/sendFCMMessage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../../Controllers/profile_controller.dart';
import '../../../Core/AppRoutes.dart';
import '../../../Data/Models/NotificationModel.dart';

class SendNotification extends StatefulWidget {
  const SendNotification({Key? key}) : super(key: key);

  @override
  State<SendNotification> createState() => _SendNotificationState();
}

class _SendNotificationState extends State<SendNotification> {

  File? image;
  String imageUrl = "";
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController channel = TextEditingController();
  bool loading  = false;

  @override
  @override
  void initState() {
    setState(() {
      channel.text = "all";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
            'Send Notification', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.0),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(color: primaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: descriptionController,
                maxLines: 3,
                minLines: 3,
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(color: primaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: channel,
                decoration: InputDecoration(
                  labelText: 'Channel',
                  labelStyle: TextStyle(color: primaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              // Row(
              //   children: [
              //     Text("Image", style: TextStyle(color: primaryColor, fontSize: 20, fontWeight: FontWeight.normal),),
              //   ],
              // ),
              // SizedBox(height: 10.0),
              // GestureDetector(
              //   onTap: () async {
              //     var pickedFile = await ImagePicker()
              //         .pickImage(source: ImageSource.gallery);
              //     if (pickedFile != null) {
              //       setState(() {
              //         image = File(pickedFile.path);
              //       });
              //     }
              //   },
              //   child: Stack(
              //       clipBehavior: Clip.none,
              //       alignment: Alignment.center,
              //       children: <Widget> [
              //         Container(
              //           height: 200,
              //           width: Get.width,
              //           decoration: new BoxDecoration(
              //             color: primaryColor,
              //             border:
              //             Border.all(color: Colors.transparent, width: 1.5),
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           child: image == null ?
              //           ClipRRect(
              //             borderRadius: BorderRadius.circular(10),
              //             child: Icon(Icons.add_a_photo, size: 50, color: Colors.white,),
              //           )
              //               : ClipRRect(
              //               borderRadius: BorderRadius.circular(10),
              //               child: Image.file(image!, fit: BoxFit.cover,)),
              //         ),
              //       ]
              //   ),
              // ),
              // SizedBox(height: 20.0),
              loading ? Center(child: CircularProgressIndicator(color: primaryColor,)) : InkWell(
                onTap: () async {
                  setState(() {
                    loading = true;
                  });
                  if(titleController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
                    // if (image != null) {
                    //   var upload = await FirebaseStorage.instance
                    //       .ref()
                    //       .child("notification_pictures")
                    //       .child(Random().nextInt(100000).toString())
                    //       .putFile(image!);
                    //   var downloadUrl = await upload.ref.getDownloadURL();
                    //   setState(() {
                    //     imageUrl = downloadUrl;
                    //   });
                    //   await sendPush();
                    // }
                    // else {
                    //   await sendPush();
                    // }
                    await sendFCMMessage(titleController.text, descriptionController.text, channel.text);
                  }
                  else{
                    print("Please fill all the fields");
                  }
                  setState(() {
                    loading = false;
                  });
                },
                onLongPress: () {
                  print("object");
                },
                child: Container(
                  width: Get.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text('Send Notification', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
