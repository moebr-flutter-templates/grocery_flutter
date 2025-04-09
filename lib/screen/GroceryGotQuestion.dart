import 'package:flutter/material.dart';
import 'package:grocery_flutter/screen/PurchaseMoreScreen.dart';
import 'package:grocery_flutter/utils/AppWidget.dart';
import 'package:grocery_flutter/utils/GeoceryStrings.dart';
import 'package:grocery_flutter/utils/GroceryColors.dart';
import 'package:grocery_flutter/utils/GroceryConstant.dart';
import 'package:nb_utils/nb_utils.dart';

class GroceryGotQuestionScreen extends StatefulWidget {
  static String tag = '/GroceryGotQuestionScreen';

  @override
  _GroceryGotQuestionScreenState createState() => _GroceryGotQuestionScreenState();
}

class _GroceryGotQuestionScreenState extends State<GroceryGotQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grocery_color_white,
        elevation: 0.0,
        leading: Icon(
          Icons.clear,
          size: 30,
          color: grocery_lightGrey,
        ).onTap(() {
          finish(context);
        }),
        title: text(grocery_gotQuestion, fontSize: textSizeNormal, fontFamily: fontBold),
      ),
      body: PurchaseMoreScreen(),
    );
  }
}
