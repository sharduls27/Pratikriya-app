import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'profile_info_row.dart';
import 'sign_in.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future getUserData() async {
    DocumentSnapshot userData =
        await documentReference.collection('user_data').document(uid).get();

    return userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[600],
            ),
          ),
          Container(
            width: 140,
            decoration: BoxDecoration(
              color: Color(0xFF00008b),
            ),
          ),
          FutureBuilder(
            future: getUserData(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                String gender = snapshot.data['gender'];
                String address = snapshot.data['address'];
                String name = snapshot.data['name'];

                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Card(
                            margin: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(250, 170),
                                bottomRight: Radius.elliptical(250, 170),
                              ),
                            ),
                            elevation: 10,
                            color: Colors.lightBlue[400],
                            child: SafeArea(
                              child: Column(
                                children: <Widget>[
                                  Row(),
                                  SizedBox(height: 50),
                                  Stack(
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.transparent,
                                        child: Icon(Icons.account_circle,
                                            size: 50),
                                      ),
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          imageUrl,
                                        ),
                                        radius: 60,
                                        backgroundColor: Colors.transparent,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 60),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 10,
                        ),
                        child: Column(
                          children: <Widget>[
                            ProfileInfoRow(
                              rowKey: 'Name: ',
                              rowValue: name,
                            ),
                            SizedBox(height: 30),
                            ProfileInfoRow(
                              rowKey: 'Gender: ',
                              rowValue: gender,
                            ),
                            SizedBox(height: 30),
                            ProfileInfoRow(
                              rowKey: 'Address: ',
                              rowValue: address,
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
            },
          ),
          SafeArea(
            child: InkWell(
              splashColor: Colors.black,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 10,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                child: RaisedButton(
                  elevation: 8,
                  color: Colors.red[800],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "SIGN OUT",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    signOutGoogle();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      ModalRoute.withName('/'),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
