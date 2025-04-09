import 'package:flutter/material.dart';
import 'package:grocery_flutter/screen/PurchaseMoreScreen.dart';

class GroceryTrackOrderScreen extends StatefulWidget {
  static String tag = '/GroceryTrackOrderScreen';

  @override
  _GroceryTrackOrderScreenState createState() => _GroceryTrackOrderScreenState();
}

class _GroceryTrackOrderScreenState extends State<GroceryTrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return PurchaseMoreScreen(enableAppbar: true);
  }
}
