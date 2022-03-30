import 'dart:math';

import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:flutter/cupertino.dart';
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
  bool loader = false;
  double paymentAmount = Get.arguments;
  late Sslcommerz sslcommerz;
  @override
  void initState() {
    sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        store_id: 'shiha6243d63450d79',
        store_passwd: 'shiha6243d63450d79@ssl',
        currency: SSLCurrencyType.BDT,
        total_amount: paymentAmount,
        tran_id: 'test${Random().nextInt(9999)}',
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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                decoration: new BoxDecoration(color: Colors.white),
                child: Container(
                  width: double.infinity,
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.green),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.green.withOpacity(0.05),
                        blurRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:
                  Column(
                    children: [
                      SizedBox(height: 20,),
                      Text(
                        "Payment required for your Application",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Payable Amount:  $paymentAmount BDT",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 200,
                        child: Image.asset(
                          "assets/paymenticon.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          var response = await sslcommerz.payNow();
                          print(response.toString());
                        },
                        child: Container(
                            decoration: new BoxDecoration(
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.green,
                                  blurRadius: 0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 45),
                              child: Text('Pay Now', style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20
                              ),),
                            )),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                  // Column(
                  //   children: [
                  //     SizedBox(height: 20,),
                  //     Text(
                  //       "Payment Success!",
                  //       style: TextStyle(
                  //           fontSize: 20.0,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.blue
                  //       ),
                  //     ),
                  //     SizedBox(height: 10,),
                  //     Container(
                  //       height: 200,
                  //       child: Image.asset(
                  //         "assets/paymentsuccess.png",
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //     InkWell(
                  //       onTap: () async {
                  //         Get.offAllNamed(AppRoutes.MAINSCREEN);
                  //       },
                  //       child: Container(
                  //           decoration: new BoxDecoration(
                  //             boxShadow: [
                  //               new BoxShadow(
                  //                 color: Colors.blue,
                  //                 blurRadius: 0,
                  //               ),
                  //             ],
                  //             borderRadius: BorderRadius.circular(8),
                  //           ),
                  //           child: Padding(
                  //             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
                  //             child: Text('PROCEED', style: TextStyle(
                  //                 color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20
                  //             ),),
                  //           )),
                  //     ),
                  //     SizedBox(height: 20,),
                  //   ],
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
