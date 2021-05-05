import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pratikriya/rating_block.dart';
import 'package:pratikriya/sign_in.dart';

class UserFeedbacks extends StatelessWidget {
  Future getFeedbacks() async {
    QuerySnapshot productQuery =
        await documentReference.collection('user_feedback').getDocuments();

    return productQuery.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.blue[500],
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                      child: Text(
                        'User Feedbacks',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: FutureBuilder(
                          future: getFeedbacks(),
                          builder: (_, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount:
                                    snapshot.hasData ? snapshot.data.length : 0,
                                itemBuilder: (BuildContext context, int index) {
                                  String deptName =
                                      snapshot.data[index].data['department'];
                                  String feedbackDesc =
                                      snapshot.data[index].data['desc'];
                                  String userName =
                                      snapshot.data[index].data['name'];
                                  int downVotes =
                                      snapshot.data[index].data['down_votes'];
                                  int upVotes =
                                      snapshot.data[index].data['up_votes'];
                                  double rating =
                                      snapshot.data[index].data['rating'];

                                  return InkWell(
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         EachDepartment(
                                      //       deptName,
                                      //       deptDesc,
                                      //       webLink,
                                      //       iconLink,
                                      //     ),
                                      //   ),
                                      // );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 0, 8, 16),
                                      child: Card(
                                        color: Color(0xFF00008b),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        elevation: 8,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      deptName,
                                                      style: TextStyle(
                                                        color:
                                                            Colors.purple[100],
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            Colors.yellow[800],
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        rating.toString(),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                color: Colors.white,
                                              ),
                                              SizedBox(height: 10),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  feedbackDesc,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Text(
                                                  '- by ' + userName,
                                                  style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              Divider(
                                                color: Colors.white,
                                              ),
                                              ratingBlock(rating),
                                              Divider(
                                                color: Colors.white,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.keyboard_arrow_up,
                                                        color: Colors.green,
                                                        size: 50,
                                                      ),
                                                      Text(
                                                        upVotes.toString(),
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white54,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        color: Colors.red,
                                                        size: 50,
                                                      ),
                                                      Text(
                                                        downVotes.toString(),
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white54,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(width: 20),
                                                  Container(
                                                    height: 60,
                                                    width: 1.0,
                                                    color: Colors.white,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'comment',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
