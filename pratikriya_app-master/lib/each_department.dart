import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:pratikriya/home_screen_widgets/feedback_form.dart';
// import 'package:url_launcher/url_launcher.dart';

class EachDepartment extends StatelessWidget {
  final String deptName;
  final String deptDesc;
  final String webLink;
  final String iconLink;
  final double totalRating;
  final String docID;
  EachDepartment(
    this.deptName,
    this.deptDesc,
    this.webLink,
    this.iconLink,
    this.totalRating,
    this.docID,
  );

  // _launchWebpage() async {
  //   if (await canLaunch(webLink)) {
  //     await launch(webLink);
  //   } else {
  //     throw 'Could not launch $webLink';
  //   }
  // }

  Future<void> _launchWebpage(BuildContext context) async {
    try {
      await launch(
        webLink,
        option: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          // enableDefaultShare: true,
          // enableUrlBarHiding: true,
          // showPageTitle: false,
          animation: CustomTabsAnimation.slideIn(),
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF00008b),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton.extended(
            elevation: 5,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FeedbackForm(
                    deptName,
                    'Department Name:',
                    docID: docID,
                    totalRating: totalRating,
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.feedback,
              size: 30,
            ),
            label: Text(
              'Feedback',
              style: TextStyle(fontSize: 25),
            ),
            isExtended: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: Container(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  padding:
                                      const EdgeInsets.all(8.0), // borde width
                                  decoration: new BoxDecoration(
                                    color:
                                        Colors.blueAccent[100], // border color
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    // TODO: Uncomment this after the icons are uploaded to Firebase
                                    child: Image.network(
                                      iconLink,
                                      scale: 0.9,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                totalRating != 0
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow[600],
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            totalRating.toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          )
                                        ],
                                      )
                                    : Container(),
                              ],
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  deptName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: FlatButton(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Go to the website',
                                  style: TextStyle(
                                    color: Colors.purple[100],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.open_in_browser,
                                  color: Colors.purple[200],
                                  size: 30,
                                )
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            splashColor: Colors.purple,
                            onPressed: () => _launchWebpage(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          deptDesc,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
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
