import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Data/Models/profile_model.dart';

class EditProfileScreen extends StatefulWidget {

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  // ProfileModel profileModel = Get.arguments;
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool loader = false;

  // @override
  // void initState() {
  //   nameController.text = profileModel.name;
  //   phoneController.text = profileModel.phone;
  //   emailController.text = profileModel.email;
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.green, width: 1)),
                    labelText: "Your Name",
                    labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.green, width: 1)),
                    labelText: "Your Phone",
                    labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.green, width: 1)),
                    labelText: "Your Email",
                    labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  child: RaisedButton(
                    elevation: 0,
                    color: Colors.green,
                    textColor: Colors.white,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                    onPressed: () async {
                      // if (
                      //     phoneController.text.isNotEmpty &&
                      //     emailController.text.isNotEmpty &&
                      //     nameController.text.isNotEmpty) {
                      //   setState(() {
                      //     loader = true;
                      //   });
                      //   profileModel.name = nameController.text;
                      //   profileModel.phone = phoneController.text;
                      //   profileModel.phone = emailController.text;
                      //   await profileModel.update();
                      //   setState(() {
                      //     loader = false;
                      //   });
                      //   Get.back();
                      // }
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

