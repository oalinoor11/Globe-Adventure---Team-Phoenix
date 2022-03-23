import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Data/Models/profile_model.dart';

class EditProfileScreen extends StatefulWidget {

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // ProfileModel profileModel = Get.arguments;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController professionController = TextEditingController();

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
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Center(
          child: Text(
            "Edit Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 10),
            child: Column(
              children: [
                Container(
                  height: 150,
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                      image: NetworkImage("https://scontent.fdac11-2.fna.fbcdn.net/v/t1.6435-9/65957001_487220221850166_7397278334893162496_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeF0h-Up5BzXreiJSQWvOneFriIYRDQUdRuuIhhENBR1G6wYzRUn1MyFn8TND0B7xPlr05IMEQbu46eum4Pe_6hT&_nc_ohc=1a9SL5kiRFwAX-Eyckc&_nc_ht=scontent.fdac11-2.fna&oh=00_AT_LnN1CwAgDxRl5e3VYpQwkHCqRfMAsU5tOqr8eNN5Lqw&oe=625FEF3E"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
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
                TextField(
                  controller: professionController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.green, width: 1)),
                    labelText: "Your Profession",
                    labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: addressController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.green, width: 1)),
                    labelText: "Your Address",
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
                      //     professionController.text.isNotEmpty &&
                      //     addressController.text.isNotEmpty &&
                      //     nameController.text.isNotEmpty) {
                      //   setState(() {
                      //     loader = true;
                      //   });
                      //   profileModel.name = nameController.text;
                      //   profileModel.phone = phoneController.text;
                      //   profileModel.email = emailController.text;
                      //   profileModel.address = emailController.text;
                      //   profileModel.profession = emailController.text;
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

