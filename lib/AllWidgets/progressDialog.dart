import 'package:globeadventure/Core/appData.dart';
import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget
{
  String message;
  ProgressDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(width: 6.0),
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(primaryColor),),
              SizedBox(width: 26.0,),
              Text(message, style: TextStyle(color: primaryColor, fontSize: 12.0),),
            ],
          ),
        ),
      ),
    );
  }
}
