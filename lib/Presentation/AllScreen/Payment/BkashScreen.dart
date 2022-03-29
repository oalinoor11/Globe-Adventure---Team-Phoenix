import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class BkashScreen extends StatefulWidget {
  @override
  State<BkashScreen> createState() => _BkashScreenState();
}

class _BkashScreenState extends State<BkashScreen> {
  double paymentAmount = Get.arguments;
  late Sslcommerz sslcommerz;
  @override
  void initState() {
// Sslcommerz sslcommerz = Sslcommerz(
//     initializer: SSLCommerzInitialization(
//  //   ipn_url: "www.ipnurl.com",
//   multi_card_name: "visa,master,bkash",
//   currency: SSLCurrencyType.BDT,
//   product_category: "Food",
//   sdkType: SSLCSdkType.TESTBOX,
//   store_id: "your_store_id",
//   store_passwd: "your_store_password",
//   total_amount: "payment_amount",
//   tran_id: "custom_transaction_id"));

    sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        store_id: 'test',
        store_passwd: 'test',
        currency: SSLCurrencyType.BDT,
        total_amount: paymentAmount,
        tran_id: 'test',
        sdkType: SSLCSdkType.TESTBOX,
        multi_card_name: 'visa,master,bkash',
        product_category: 'Application Fee',
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Center(
          child: Text(
            "Payment",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: InkWell(
            onTap: () async {
              var response = await sslcommerz.payNow();
              print(response.toString());
            },
            child: Text('Pay now'),
          ),
        ),
      ),
    );
  }
}
