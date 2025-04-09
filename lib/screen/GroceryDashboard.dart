import 'package:flutter/material.dart';
import 'package:grocery_flutter/model/GroceryModel.dart';
import 'package:grocery_flutter/screen/PurchaseMoreScreen.dart';
import 'package:grocery_flutter/utils/AppWidget.dart';
import 'package:grocery_flutter/utils/GeoceryStrings.dart';
import 'package:grocery_flutter/utils/GroceryColors.dart';
import 'package:grocery_flutter/utils/GroceryConstant.dart';
import 'package:grocery_flutter/utils/GroceryDataGenerator.dart';
import 'package:grocery_flutter/utils/GroceryImages.dart';
import 'package:nb_utils/nb_utils.dart';

import 'GroceryGotQuestion.dart';
import 'GroceryNotification.dart';
import 'GroceryOrderHistory.dart';
import 'GroceryProfile.dart';
import 'GrocerySaveCart.dart';
import 'GrocerySearch.dart';
import 'GroceryStore.dart';
import 'GroceryStoreLocator.dart';
import 'GroceryTermCondition.dart';
import 'GroceryTrackOrder.dart';

class GroceryDashBoardScreen extends StatefulWidget {
  static String tag = '/GroceryDashBoardScreen';

  @override
  _GroceryDashBoardScreenState createState() => _GroceryDashBoardScreenState();
}

class _GroceryDashBoardScreenState extends State<GroceryDashBoardScreen> {
  late List<ProductModel> mFavouriteList;
  late List<ProductModel> mCartList;

  List<IconData> listImage = [
    Icons.insert_drive_file,
    Icons.location_on,
    Icons.shopping_cart,
    Icons.store,
    Icons.help,
    Icons.question_answer,
  ];

  var listText = [
    grocery_orderHistory,
    grocery_trackOrders,
    grocery_lbl_save_cart,
    grocery_storeLocator,
    grocery_lbl_Terms_and_Condition,
    grocery_gotQuestion,
  ];

  var listClick = [
    GroceryOrderHistoryScreen(),
    GroceryTrackOrderScreen(),
    GrocerySaveCart(),
    GroceryStoreLocatorScreen(),
    GroceryTermCondition(),
    GroceryGotQuestionScreen(),
  ];

  @override
  void initState() {
    super.initState();
    mFavouriteList = storeMemberItems();
    mCartList = storeMemberItems();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(grocery_colorPrimary);
    var width = MediaQuery.of(context).size.width;

    Widget mMenuOption(var icon, var value, Widget tag) {
      return Container(
        height: 70,
        child: GestureDetector(
          onTap: () {
            finish(context);
            tag.launch(context);
          },
          child: Row(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                decoration: boxDecoration(radius: 25.0, bgColor: grocery_colorPrimary_light),
                child: Icon(icon, color: grocery_colorPrimary).paddingAll(12),
              ).paddingOnly(top: spacing_control, left: spacing_standard, bottom: spacing_control),
              text(value, fontSize: textSizeLargeMedium, fontFamily: fontMedium).paddingOnly(left: spacing_standard, right: spacing_standard),
            ],
          ),
        ),
      );
    }

    final menu = IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        showGeneralDialog(
          context: context,
          barrierDismissible: true,
          transitionDuration: Duration(milliseconds: 500),
          barrierLabel: MaterialLocalizations.of(context).dialogLabel,
          barrierColor: Colors.black.withOpacity(0.5),
          pageBuilder: (context, _, __) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.clear, color: grocery_light_gray_color).onTap(() {
                            finish(context);
                          }),
                          SizedBox(width: spacing_large),
                          text("Grocery shopping app", textColor: grocery_Color_black, fontFamily: fontBold, fontSize: textSizeLargeMedium)
                        ],
                      ).paddingAll(16),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: spacing_standard),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                      ),
                      child: ListView.builder(
                        itemCount: listImage.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return mMenuOption(listImage[index], listText[index], listClick[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          transitionBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: CurvedAnimation(parent: animation, curve: Curves.easeOut).drive(Tween<Offset>(begin: Offset(0, -1.0), end: Offset.zero)),
              child: child,
            );
          },
        );
      },
    );

    return Scaffold(
      backgroundColor: grocery_app_background,
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: grocery_app_background,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: grocery_colorPrimary,
              title: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        menu,
                        SizedBox(width: spacing_large),
                        text("Store", textColor: grocery_color_white, fontFamily: fontBold, fontSize: textSizeLargeMedium),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Icon(Icons.search),
                          onTap: () {
                            GrocerySearch().launch(context);
                          },
                        ),
                        SizedBox(width: spacing_standard_new),
                        GestureDetector(
                          child: Icon(Icons.notifications),
                          onTap: () {
                            GroceryNotification().launch(context);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              bottom: TabBar(
                indicatorColor: grocery_color_white,
                tabs: [
                  Tab(icon: Image.asset(grocery_ic_shop, color: grocery_color_white, height: 20, width: 20)),
                  Tab(icon: Icon(Icons.shopping_basket)),
                  Tab(icon: Image.asset(grocery_ic_outline_favourite, color: grocery_color_white, height: 20, width: 20)),
                  Tab(icon: Image.asset(Grocery_ic_User, color: grocery_color_white, height: 20, width: 20))
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[GroceryStore(), PurchaseMoreScreen(), PurchaseMoreScreen(), GroceryProfile()],
              //children: <Widget>[Text("1"), Text("2"), Text("3"), Text("4")],
            ),
          ),
        ),
      ),
    );
  }
}
