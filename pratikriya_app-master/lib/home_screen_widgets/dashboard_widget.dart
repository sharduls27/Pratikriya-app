import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'department_screen.dart';
import 'home_card.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({
    Key key,
  }) : super(key: key);

  // Future getProducts() async {
  //   QuerySnapshot productQuery =
  //       await documentReference.collection('departments').getDocuments();

  //   return productQuery.documents;
  // }

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
        Column(
          children: <Widget>[
            Container(
              child: Align(
                alignment: Alignment.topCenter,
                child: Card(
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  elevation: 0,
                  color: Colors.blue[600],
                  child: SafeArea(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: CarouselSlider(
                        autoPlay: true,
                        viewportFraction: 1.5,
                        height: 185,
                        items: <Widget>[
                          Image.asset('assets/images/banner1.jpg'),
                          Image.asset('assets/images/banner2.jpg'),
                          Image.asset('assets/images/banner3.jpg'),
                          Image.asset('assets/images/banner4.jpg'),
                          Image.asset('assets/images/banner5.jpg'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
              crossAxisCount: 2,
              children: <Widget>[
                HomeCardWidget('Essentials', 0),
                HomeCardWidget('Departments', 1),
                HomeCardWidget('Schemes', 2),
                HomeCardWidget('Quick Feedback', 3)
              ],
            )
                // Container(
                //   child: FutureBuilder(
                //     future: getProducts(),
                //     builder: (_, snapshot) {
                //       if (snapshot.connectionState == ConnectionState.waiting) {
                //         return Center(
                //           child: CircularProgressIndicator(),
                //         );
                //       } else {
                //         return ListView.builder(
                //             itemCount:
                //                 snapshot.hasData ? snapshot.data.length : 0,
                //             itemBuilder: (BuildContext context, int index) {
                //               String deptName = snapshot.data[index].data['name'];
                //               String deptDesc = snapshot.data[index].data['desc'];
                //               // TODO: Uncomment this after the icons are uploaded to Firebase
                //               String iconLink = snapshot.data[index].data['icon'];
                //               String webLink =
                //                   snapshot.data[index].data['web_link'];

                //               return Padding(
                //                 padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                //                 child: Card(
                //                   color: Color(0xFF00008b),
                //                   shape: RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(20),
                //                   ),
                //                   elevation: 8,
                //                   child: Padding(
                //                     padding: const EdgeInsets.all(20),
                //                     child: Row(
                //                       children: <Widget>[
                //                         Container(
                //                           padding: const EdgeInsets.all(
                //                               8.0), // borde width
                //                           decoration: new BoxDecoration(
                //                             color: Colors
                //                                 .blueAccent[100], // border color
                //                             shape: BoxShape.circle,
                //                           ),
                //                           child: CircleAvatar(
                //                             radius: 30,
                //                             backgroundColor: Colors.white,
                //                             // TODO: Uncomment this after the icons are uploaded to Firebase
                //                             child: Image.network(
                //                               iconLink,
                //                               scale: 0.9,
                //                             ),
                //                           ),
                //                         ),
                //                         SizedBox(width: 12),
                //                         Expanded(
                //                           child: Column(
                //                             crossAxisAlignment:
                //                                 CrossAxisAlignment.start,
                //                             mainAxisSize: MainAxisSize.max,
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.spaceAround,
                //                             children: <Widget>[
                //                               Text(
                //                                 deptName,
                //                                 textAlign: TextAlign.start,
                //                                 style: TextStyle(
                //                                   color: Colors.white,
                //                                   fontSize: 20,
                //                                   fontWeight: FontWeight.bold,
                //                                 ),
                //                               ),
                //                               SizedBox(height: 8),
                //                               Text(
                //                                 deptDesc,
                //                                 overflow: TextOverflow.ellipsis,
                //                                 maxLines: 2,
                //                                 textAlign: TextAlign.start,
                //                                 style: TextStyle(
                //                                   color: Colors.white70,
                //                                   fontSize: 15,
                //                                 ),
                //                               ),
                //                             ],
                //                           ),
                //                         )
                //                       ],
                //                     ),
                //                   ),
                //                 ),
                //               );
                //             });
                //       }
                //     },
                //   ),
                // ),
                )
          ],
        ),
      ],
    );
  }
}
