import 'package:flutter/material.dart';
import 'package:pratikriya/each_department.dart';
import 'package:pratikriya/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DepartmentScreen extends StatelessWidget {
  Future getProducts() async {
    QuerySnapshot productQuery =
        await documentReference.collection('departments').getDocuments();

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
        SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.blue[500],
              elevation: 0,
              title: Text(
                'Departments',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: FutureBuilder(
                            future: getProducts(),
                            builder: (_, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return ListView.builder(
                                    itemCount: snapshot.hasData
                                        ? snapshot.data.length
                                        : 0,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      String deptName =
                                          snapshot.data[index].data['name'];
                                      String deptDesc =
                                          snapshot.data[index].data['desc'];
                                      // TODO: Uncomment this after the icons are uploaded to Firebase
                                      String iconLink =
                                          snapshot.data[index].data['icon'];
                                      String webLink =
                                          snapshot.data[index].data['web_link'];

                                      double totalRating = snapshot
                                          .data[index].data['total_rating'].toDouble();

                                      String docID =
                                          snapshot.data[index].data['id'];

                                      if (totalRating == null) totalRating = 0;

                                      return InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EachDepartment(
                                                deptName,
                                                deptDesc,
                                                webLink,
                                                iconLink,
                                                totalRating,
                                                docID,
                                              ),
                                            ),
                                          );
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
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0), // borde width
                                                    decoration:
                                                        new BoxDecoration(
                                                      color: Colors.blueAccent[
                                                          100], // border color
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: CircleAvatar(
                                                      radius: 30,
                                                      backgroundColor:
                                                          Colors.white,
                                                      // TODO: Uncomment this after the icons are uploaded to Firebase
                                                      child: Image.network(
                                                        iconLink,
                                                        scale: 0.9,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 12),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: <Widget>[
                                                        Text(
                                                          deptName,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(height: 8),
                                                        Text(
                                                          deptDesc,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                            color:
                                                                Colors.white70,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    });
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
        ),
      ],
    );
  }
}
