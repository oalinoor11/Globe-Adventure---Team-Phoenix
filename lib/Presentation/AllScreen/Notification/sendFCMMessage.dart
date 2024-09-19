
import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:googleapis/servicecontrol/v1.dart' as servicecontrol;

import '../../../Data/Models/NotificationModel.dart';

Future<void> sendFCMMessage(String title, String body) async {
  final String serverKey = await getAccessToken() ; // Your FCM server key
  final String fcmEndpoint = 'https://fcm.googleapis.com/v1/projects/wazychat/messages:send';
  final Map<String, dynamic> message = {
    'message': {
      'topic': "all",
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
    print('FCM message sent successfully');
    await NotificationModel(
      timeStamps: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: body,
      image: "",
    )..save();
  } else {
    print('Failed to send FCM message: ${response.statusCode}');
  }
}


Future<String> getAccessToken() async {
  final serviceAccountJson = {
    "type": "service_account",
    "project_id": "durbar-club",
    "private_key_id": "b2e8a827e6b938b6bc80195090d3d199d224f5fc",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDAmpXZb5nGbJyY\nxL6UeGsMspugOKteM2SoZPSO6MPXsu5MtqjKQRT5UNI2q1YPdo8/tdLXCyjWiXOs\nZP3OckYJyPua7Y/CpO5x7mAEsPF9f68kdms2WuV4e9wAUhwPj3LfS9yMkiQNbAoh\nNw9hkRc6Kzkz1qORW2bPLYaqTaT2RHdeGMOSFqsywE+GPP7Ig5pikEZKTD+EqtEy\nR1OZMl+uzJNauWKTttoC70LJ2kxG/s4NKCBjhJOvrB2yMrTfubXLVCA/NNupZua4\n4st8YFjOmtijrjbzB4AplYfJ3ZmqBpRXiyT2ncf/hi4hpfUJg8SzMZ91IOGi2lt6\nM7/WxXFRAgMBAAECggEAEKkuqOz/qIumWOFoD7As/nUILlTIn4ZNlkg0DuqxX5wn\nA17SUhCi2lWfTEMHrPXCEC5P1fICrzBGX9V/+Rb8hQXW8gDL101szPvkYB4tqFVe\nbAaMYVrSj9i9tWS6Ra77LmLBv4KNeNXC4zr/6x43G/03iQrvrPgdosgFkVTUc3MJ\nHVe9ggCSlJLabJVG1QuWUXHiZ/tfUmUuh4XigDOlyr9ZpU6bR8pNFxND4UFxa9h6\n65ZYb7r0PXpkjBd3oQOHeN0VmmlMBmYGKgAU9XGOlUc6P1efkaBkr9c+0Y3RqaXY\nYoHE3GghzKBm7xrRcOg0xJkGZIyreEU39RJ4RG3jWwKBgQD29vgj44bgNhldU0lm\n423ZzqmrHkjpihEAGeivj2ki1mzk/btaKeh7QV7ndLMLCeKXNtnYF/I5zxun/O5D\noiZvI9EkfgCpK5Vsz2TiIJKdCoKvTen3BGCX5tWkxLcX/MSM1EqTAODReLlDnWYq\nhdp06aI+GMrwdsC5FJIC7JqyBwKBgQDHpnspb5/4ZIuYq+jKKYIgad2v2iWNAVBf\ngI6n+l2uvgao6EI+0vbrKTJ6c7t5JQBF2y2gKK2auZ5Iua88Mo63P9/0aNCAgXGR\ng0bDH/pghQL/N0L8UGcOivzwU+mK/t7ZWrWyeONb/Tq92VPp7PHa9CElZZ69uBWe\nxXb9ThOL5wKBgQDoqfdQaFRy+sSepY5rfivJnOc/rQJn8ojdnYsXinY0OerROTG+\nWekJ5aYxTEI5ThDJAQXujXDIgZO+iY027pZi8k1gocyhk8vsfN7AIou9o19HJJId\nA2S09uWjmygbUykgvAedwqAK+D8hsjHEMeKDbnBJLDZUoKwkMXr1gk6jFQKBgCXW\nyr72tgX44HBGHK+8IDqOdgKvQLCx0A7Zqa/yhrDouRBoPK31g/Db9QI6TwzN03hp\n6wLQ0t5hUbuM3cZ1+pCGnaaP+vxwDBs9Gzs+I1EJxKCkU6DIiE+8TeYqsTezyH6/\nb3Js8QJtQyXaO8o5KzmJTYLt+KESc56M5Flr485/AoGAA/s9830VjMKx0x4zztjN\nHatkEyv+i0F5iOWqTjlvXr7OcW2QLMsyhca0VdJtcv3e4AUzybtyjws2tHQBSJKR\nGOcXq7+3ppybT/7qbyTSdAp93sgVU7GN6EFfjYV2Wl4BL2vd/tjfFRePLx8xY5dP\njm/3YX94WgKJ+YxpBb8M7Gc=\n-----END PRIVATE KEY-----\n",
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