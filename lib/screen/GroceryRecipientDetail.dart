import 'package:flutter/material.dart';
import 'package:grocery_flutter/screen/PurchaseMoreScreen.dart';
import 'package:grocery_flutter/utils/AppWidget.dart';
import 'package:grocery_flutter/utils/GeoceryStrings.dart';
import 'package:grocery_flutter/utils/GroceryColors.dart';
import 'package:nb_utils/nb_utils.dart';

class GroceryRecipientDetail extends StatefulWidget {
  static String tag = '/GroceryRecipientDetail';

  @override
  _GroceryRecipientDetailState createState() => _GroceryRecipientDetailState();
}

class _GroceryRecipientDetailState extends State<GroceryRecipientDetail> {
  @override
  void dispose() {
    super.dispose();
    changeStatusColor(grocery_colorPrimary);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(grocery_colorPrimary);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: grocery_colorPrimary,
          iconTheme: IconThemeData(color: grocery_color_white),
          actionsIconTheme: IconThemeData(color: grocery_color_white),
          title: Text(grocery_lbl_Recipient_Details, style: boldTextStyle(color: Colors.white)),
        ),
        backgroundColor: grocery_app_background,
        body: PurchaseMoreScreen(),
      ),
    );
  }
}
