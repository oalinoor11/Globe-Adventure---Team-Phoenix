
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:googleapis/servicecontrol/v1.dart' as servicecontrol;

import '../../../Data/Models/NotificationModel.dart';

Future<void> sendFCMMessage(String title, String body, String channel) async {
  final String serverKey = await getAccessToken() ; // Your FCM server key
  final String fcmEndpoint = 'https://fcm.googleapis.com/v1/projects/durbar-club/messages:send';
  final Map<String, dynamic> message = {
    'message': {
      'topic': channel,
      'notification': {
        "title": title,
        "body": body,
        // "image": "https://codecamp.com.bd/wp-content/uploads/2024/05/mobileappbootcamp.jpg.webp"
      },
      'data': {
        // "url": "<url of media image>",
        // "dl": "<deeplink action on tap of notification>"
      },
      "android": {
        "notification": {
          // "sound": "assets/notificationtone.mp3",
        }
      },
      "apns": {
        "payload": {
          "aps": {
            "sound" : "notificationtone.mp3",
          }
        }
      }
    }
  };

  final http.Response response = await http.post(
    Uri.parse(fcmEndpoint),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $serverKey',
    },
    body: jsonEncode(message),
  );

  if (response.statusCode == 200) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text('Notification sent successfully', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
    );
    Get.back();
    await NotificationModel(
      timeStamps: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: body,
      image: "",
    )..save();
  } else {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text('Failed to send Notification', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
    );
    print('Failed to send FCM message: ${response.statusCode}');
    print('${response.body}');
  }
}


Future<String> getAccessToken() async {
  final serviceAccountJson = {
    "type": "service_account",
    "project_id": "durbar-club",
    "private_key_id": "d0fe1f88e374aa38cdf0b837641214036d97880a",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEuwIBADANBgkqhkiG9w0BAQEFAASCBKUwggShAgEAAoIBAQDlAH5ZPfCR8X2K\n/R04au5DXLOlkEAgxvCbDn/VrBxCWRjH+UrIvpk2RL+SLwgFyTxZ26yKIqrRCVLG\nahSULYmLbqsA8tCn8p5QaWpc3V1SA/ylISJYzFHw3FzdgiqgHhvhVcKNL30SNipl\nvOTCsGViqcuBAWA4OZ2kUl02apoPbF9nmvI7DJZsMrrOh4h111bj4Tqst/TeDV6g\nt7J/LHU7BTsjl0OYS8nCn1CSzaT3pGLsBoZa7f1yvWj+PqhaYjrwY54vve/iOwaI\n6yiVWHCyFNzrArpnLYo5LEHNASYhxrSs06RGDM+5DuT0cHPrachwEs5UvoymOwiD\nYrnhu+sFAgMBAAECgf8Iir3XoJE1epO6JoIudPi3xrMGuqc6COtIWtI5hetmHOpT\np/XsfMrltKLrAMqz1F2IDXJl5XC/USZL96SvX7uBaGwPU6hyFAnQMEBCT7AZKDlZ\nwRfu5wGVLJKWgEMaUG3NdzQeKaUmbgPFUikoJu+fos2//ToTsNDR9OKRA3EzpCuV\nIswh0wxlBQgvHlcCfRAnDsYch+ehHcb2CHEH3L74M69Ue3E7f1HxcS7tHuGqyW3L\nTApLj3kST6fIYZgMjYn6lfb4r3+S2KCMY3nPjAYfJO0thJWKnCnCnL1uRQcm3ILr\n9etVIS3YUJxkb9N9wqKPwZjdO9lf2N8F3d8lYeMCgYEA/bgKp6IdviBf91IAWFIq\nyf0TdM4HLGNS8btjDK74Qdip9iw3XaZpOEDzkBVRo0Vv6pFI1uSTSddAdNRAS+UE\nr1FJOU7OPoAFC1bO4TCB87efJCkCoOGAKs1gERKAeAWlvaGxRFovOhWDLlNZv7c6\nnHsoKuumEcIWASXMBfAj8dcCgYEA5w+QPF6MHNvcSeVAif8X6Zr77o0oOXynSkSV\nxXugqmqRyqC9aHVjAPOr519dyTPw6azkwmehjUWRH3CatyJh+wzHR7ZSRD73/wfO\n6PTKsiwqjZgWQPJwlS6ctFeeCbOdUgUr6KCIcNM64nMgyLRjtdmApcMJmUPL1h3t\n6Ipw5oMCgYAMWoSyStN16W+ixCxeIIoS0a671jhFMgTc3knhWTefRSRpZxe/CJZA\n9fCmCFO0RnI/kplgVTrSspdh2N/Uki8bNjMBhlPGeUdFmRFzp3/8VOl7wj9tg+1Q\nqDVQP31f2q6KQDA4ase35UpA3DAXhJ1m9xwqktTAMpoNrkBz3ZByewKBgGxYzO6x\n+wuRQSPZf0D2QDVHenkq8cC7JgraTEy1IuqmXETiyM5RtSH+IQ62lljBpWc9rmtG\nguemxl0yxSm40q8RF+UVpk/gIxQQikKMfvu7YBzTQyQjSw15NPwP1ciA0/Vg/Wzw\n0ent8r+68pWKmPLt0bho03ht5Qg7MpMHT9eXAoGBALBS7vhD4nbsHjPwc5Z5jctx\nMUe4TVsMgxAZuusUmDsEsTei7JqYgu1cRdP9itdyLUcKaGzEdkNHsKrWFEUpuCps\nKuv6gLsE/KpcicjzpJkai5pzFW/6L8y5z8Nc+Yuopw/UqDHcp4YFeCZRW4aSzGIv\nq6MVnSSvC5sLaPLV2HTR\n-----END PRIVATE KEY-----\n",
    "client_email": "firebase-adminsdk-b0p6m@durbar-club.iam.gserviceaccount.com",
    "client_id": "101389869163102986904",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-b0p6m%40durbar-club.iam.gserviceaccount.com",
    "universe_domain": "googleapis.com"
  };

  List<String> scopes = [
    "https://www.googleapis.com/auth/userinfo.email",
    "https://www.googleapis.com/auth/firebase.database",
    "https://www.googleapis.com/auth/firebase.messaging"
  ];

  http.Client client = await auth.clientViaServiceAccount(
    auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
    scopes,
  );

  // Obtain the access token
  auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client
  );

  // Close the HTTP client
  client.close();

  // Return the access token
  return credentials.accessToken.data;

}