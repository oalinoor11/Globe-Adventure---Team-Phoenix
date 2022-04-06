import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Presentation/AllScreen/Profile/EditProfileScreen.dart';

class FillYourProfileDialog extends StatefulWidget {
  const FillYourProfileDialog({Key? key}) : super(key: key);

  @override
  _FillYourProfileDialogState createState() => _FillYourProfileDialogState();
}

class _FillYourProfileDialogState extends State<FillYourProfileDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: Get.width * 0.8,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please fill your profile first',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => EditProfileScreen());
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Fill Profile',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
