import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_flutter/utils/AppWidget.dart';
import 'package:grocery_flutter/utils/GeoceryStrings.dart';
import 'package:grocery_flutter/utils/GroceryColors.dart';
import 'package:grocery_flutter/utils/GroceryConstant.dart';
import 'package:grocery_flutter/utils/GroceryImages.dart';
import 'package:grocery_flutter/utils/GroceryWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class GroceryWriteReview extends StatefulWidget {
  static String tag = '/GroceryWriteReview';

  @override
  GroceryWriteReviewState createState() => GroceryWriteReviewState();
}

class GroceryWriteReviewState extends State<GroceryWriteReview> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(grocery_color_white);

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: grocery_app_background,
      body: SafeArea(
        child: Container(
          width: width,
          decoration: BoxDecoration(
              color: grocery_color_white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: const Radius.circular(20.0),
              ),
              boxShadow: <BoxShadow>[BoxShadow(color: grocery_ShadowColor, blurRadius: 20.0, offset: Offset(0.0, 0.9))]),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        finish(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: grocery_icon_color,
                      ),
                    ),
                    SizedBox(
                      width: spacing_standard_new,
                    ),
                    text(grocery_title_write_review, fontFamily: fontBold)
                  ],
                ),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: CachedNetworkImageProvider(Grocery_ic_Profile),
                    ),
                    SizedBox(
                      width: spacing_standard_new,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RatingBarWidget(
                          rating: 5,
                          size: 20,
                          onRatingChanged: (c) {
                            //
                          },
                        ),
                        text(grocery_username, fontFamily: fontMedium),
                      ],
                    )
                  ],
                ).paddingAll(spacing_standard_new),
                EditText(
                  text: grocery_title_write_review,
                  isPassword: false,
                  keyboardType: TextInputType.text,
                ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text("5 out of 50 Words"),
                    FittedBox(
                      child: groceryButton(
                        textContent: grocery_lbl_send,
                        onPressed: (() {}),
                      ),
                    )
                  ],
                ).paddingAll(spacing_standard_new),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
