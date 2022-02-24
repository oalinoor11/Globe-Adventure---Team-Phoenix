import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class EditCareerCoachScreen extends StatelessWidget {

  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Edit Coach",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.text, cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Colors.green, width: 1)),
                  labelText: "Coach Name",
                  labelStyle: TextStyle(
                      fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text, cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Colors.green, width: 1)),
                  labelText: "Coach Title",
                  labelStyle: TextStyle(
                      fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text, cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Colors.green, width: 1)),
                  labelText: "Coach Description",
                  labelStyle: TextStyle(
                      fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text, cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Colors.green, width: 1)),
                  labelText: "Coach Intro url",
                  labelStyle: TextStyle(
                      fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  print("camera button clicked");
                  var pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                },
                child: Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Text("Coach Photo",
                          style: TextStyle(
                              color: Colors.black, fontSize: 16)),
                      SizedBox(width: 10),
                      Icon(
                        Icons.add_a_photo,
                        size: 20,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(height: 50,
                child: RaisedButton(
                  elevation: 0,
                  color: Colors.green,
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Text(
                      "Save Changes",
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(height: 50,
                child: RaisedButton(
                  elevation: 0,
                  color: Colors.red,
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  onPressed: () {
                    var result = CoolAlert.show(
                      backgroundColor: Colors.green,
                      confirmBtnColor: Colors.red,
                      confirmBtnText: ("Delete"),
                      width: 10,
                      context: context,
                      type: CoolAlertType.confirm,
                      onCancelBtnTap: () =>
                          Get.back(result: false),
                      onConfirmBtnTap: () =>
                          Get.back(result: true),
                    );
                    // if (result) {
                    //   var response =
                    //       await MaterialRepository()
                    //       .deleteMaterial(e);
                    //   if (response) {
                    //     await CoolAlert.show(
                    //         context: context,
                    //         type: CoolAlertType.success);
                    //   } else {
                    //     await CoolAlert.show(
                    //         context: context,
                    //         type: CoolAlertType.error);
                    //   }
                    // }
                  },
                  child: Center(
                    child: Text(
                      "Delete Coach",
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
