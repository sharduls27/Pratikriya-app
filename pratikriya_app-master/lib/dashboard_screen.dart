import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:pratikriya/user_feedbacks.dart';

import 'home_screen_widgets/dashboard_widget.dart';
import 'profile_screen.dart';
import 'sign_in.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;
  FocusNode _productFocusNode = FocusNode();
  FocusNode _rewardFocusNode = FocusNode();

  String newProduct;
  String newRewardPoint;

  int currentPage = 0;
  // Future getProducts() async {
  //   QuerySnapshot productQuery =
  //       await documentReference.collection('departments').getDocuments();

  //   return productQuery.documents;
  // }

  Future getUserData() async {
    QuerySnapshot usersData =
        await documentReference.collection('user_data').getDocuments();

    return usersData.documents;
  }

  void _addProduct() async {
    DocumentReference documentReferencer =
        documentReference.collection('products').document();

    Map<String, dynamic> data = <String, dynamic>{
      "name": newProduct,
      "reward_points": int.tryParse(newRewardPoint),
    };

    await documentReferencer.setData(data).whenComplete(() {
      print("product added");
    }).catchError((e) => print(e));
  }

  String validateProduct(String value) {
    if (value.length == 0)
      return 'Product name cannot be empty';
    else
      return null;
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      _autoValidate = true;
    }
  }

  String validateRewardPoints(String value) {
    if (value.length == 0)
      return 'Reward points cannot be empty';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      DashboardWidget(),
      UserFeedbacks(),
      ProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: FancyBottomNavigation(
        barBackgroundColor: Colors.deepPurple[800],
        inactiveIconColor: Colors.white70,
        activeIconColor: Colors.white,
        textColor: Colors.white,
        circleColor: Colors.blueAccent[400],
        initialSelection: currentPage,
        tabs: [
          TabData(
            iconData: Icons.dashboard,
            title: "Dashboard",
          ),
          TabData(
            iconData: Icons.feedback,
            title: "Feedbacks",
          ),
          TabData(
            iconData: Icons.account_circle,
            title: "Profile",
          ),
        ],
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
      body: _widgetOptions[currentPage],
    );
  }
}
