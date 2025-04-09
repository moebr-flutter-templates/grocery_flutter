import 'package:flutter/material.dart';
import 'package:grocery_flutter/screen/PurchaseMoreScreen.dart';
import 'package:grocery_flutter/utils/AppWidget.dart';
import 'package:grocery_flutter/utils/GeoceryStrings.dart';
import 'package:grocery_flutter/utils/GroceryColors.dart';
import 'package:grocery_flutter/utils/GroceryConstant.dart';
import 'package:nb_utils/nb_utils.dart';

class GroceryAddPaymentScreen extends StatefulWidget {
  static String tag = '/GroceryAddPaymentScreen';

  @override
  _GroceryAddPaymentScreenState createState() => _GroceryAddPaymentScreenState();
}

class _GroceryAddPaymentScreenState extends State<GroceryAddPaymentScreen> {
  @override
  void dispose() {
    super.dispose();
    changeStatusColor(grocery_colorPrimary);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(grocery_colorPrimary);
    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: AppBar(
        backgroundColor: grocery_colorPrimary,
        leading: Icon(
          Icons.arrow_back,
          size: 30,
          color: grocery_color_white,
        ).onTap(() {
          finish(context);
        }),
        title: text(grocery_paymentMethod, fontSize: textSizeNormal, textColor: grocery_color_white),
      ),
      body: PurchaseMoreScreen(),
    );
  }
}
