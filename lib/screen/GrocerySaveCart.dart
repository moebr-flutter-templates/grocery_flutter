import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_flutter/screen/PurchaseMoreScreen.dart';
import 'package:grocery_flutter/utils/AppWidget.dart';
import 'package:grocery_flutter/utils/GeoceryStrings.dart';
import 'package:grocery_flutter/utils/GroceryColors.dart';
import 'package:grocery_flutter/utils/GroceryWidget.dart';

class GrocerySaveCart extends StatefulWidget {
  static String tag = '/GrocerySaveCart';

  @override
  GrocerySaveCartState createState() => GrocerySaveCartState();
}

class GrocerySaveCartState extends State<GrocerySaveCart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(grocery_colorPrimary);
    return Scaffold(
      backgroundColor: grocery_app_background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: title(grocery_lbl_save_cart, grocery_colorPrimary, grocery_color_white, context),
      ),
      body: PurchaseMoreScreen(),
    );
  }
}
