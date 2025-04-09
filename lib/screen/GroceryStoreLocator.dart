import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_flutter/screen/PurchaseMoreScreen.dart';
import 'package:grocery_flutter/utils/AppWidget.dart';
import 'package:grocery_flutter/utils/GeoceryStrings.dart';
import 'package:grocery_flutter/utils/GroceryColors.dart';
import 'package:grocery_flutter/utils/GroceryConstant.dart';
import 'package:nb_utils/nb_utils.dart';

class GroceryStoreLocatorScreen extends StatefulWidget {
  static String tag = '/GroceryStoreLocatorScreen';

  @override
  _GroceryStoreLocatorScreenState createState() => _GroceryStoreLocatorScreenState();
}

class _GroceryStoreLocatorScreenState extends State<GroceryStoreLocatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 1,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(120),
              child: Container(
                color: grocery_colorPrimary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            finish(context);
                          },
                          icon: Icon(
                            Icons.clear,
                            size: 30,
                            color: grocery_color_white,
                          ),
                        ).paddingOnly(right: 24),
                        Expanded(child: text(grocery_storeLocator, fontSize: textSizeNormal, textColor: grocery_color_white, fontFamily: fontBold)),
                        Icon(
                          Icons.search,
                          size: 30,
                          color: grocery_color_white,
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TabBar(
                        indicatorWeight: 4.0,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: grocery_color_white,
                        labelColor: grocery_color_white,
                        isScrollable: false,
                        unselectedLabelColor: grocery_color_white.withOpacity(0.5),
                        onTap: (index) {
                          //
                        },
                        tabs: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              grocery_allStores,
                              style: TextStyle(fontSize: textSizeMedium),
                            ),
                          ),
                        ],
                      ),
                    ).paddingOnly(top: 24),
                  ],
                ).paddingOnly(left: 12, right: 16),
              ),
            ),
            body: TabBarView(
              children: <Widget>[PurchaseMoreScreen()],
              physics: NeverScrollableScrollPhysics(),
            ),
          ),
        ),
      ),
    );
  }
}
