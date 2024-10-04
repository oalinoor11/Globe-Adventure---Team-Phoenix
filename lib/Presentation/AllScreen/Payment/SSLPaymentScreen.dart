import 'package:durbarclub/Controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:webview_flutter/webview_flutter.dart';

import '../../../Core/appData.dart';

class SSLPaymentScreen extends StatefulWidget {
  @override
  State<SSLPaymentScreen> createState() => _SSLPaymentScreenState();
}

class _SSLPaymentScreenState extends State<SSLPaymentScreen> {
  bool loader = true;
  String amount = Get.arguments;
  // late WebViewController controller;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Center(
          child: Text(
            "Payment",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        automaticallyImplyLeading: false,
      ),

      body: Stack(
        children: [
          // Positioned.fill(
          //   child: WebView(
          //     initialUrl:
          //     Uri.encodeFull("$paymentUrl/pay.php?payment_amount=${amount}&customer_name=${ProfileController.to.profile.value!.name}&customer_email=${ProfileController.to.profile.value!.email}&phone=${ProfileController.to.profile.value!.phone}&currency=BDT"),
          //     javascriptMode: JavascriptMode.unrestricted,
          //     onWebViewCreated: (WebViewController webViewController) {
          //       controller = webViewController;
          //     },
          //     onPageFinished: (url) {
          //       setState(() {
          //         loader = false;
          //       });
          //       if (url.contains("$paymentUrl/success")) {
          //         Get.back(result: true);
          //       } else if (url.contains("$paymentUrl/fail")) {
          //         Get.back(result: false);
          //       }
          //     },
          //   ),
          // ),
          if (loader)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.1),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }
}
