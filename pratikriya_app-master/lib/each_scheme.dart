import 'package:flutter/material.dart';
import 'package:pratikriya/home_screen_widgets/feedback_form.dart';
// import 'package:url_launcher/url_launcher.dart';

class EachScheme extends StatelessWidget {
  final String deptName;
  final String deptDesc;
  final String parentDept;
  final String imageLink;
  EachScheme(
    this.deptName,
    this.deptDesc,
    this.parentDept,
    this.imageLink,
  );

  // _launchWebpage() async {
  //   if (await canLaunch(webLink)) {
  //     await launch(webLink);
  //   } else {
  //     throw 'Could not launch $webLink';
  //   }
  // }

  // Future<void> _launchWebpage(BuildContext context) async {
  //   try {
  //     await launch(
  //       webLink,
  //       option: CustomTabsOption(
  //         toolbarColor: Theme.of(context).primaryColor,
  //         // enableDefaultShare: true,
  //         // enableUrlBarHiding: true,
  //         // showPageTitle: false,
  //         animation: CustomTabsAnimation.slideIn(),
  //         extraCustomTabs: const <String>[
  //           // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
  //           'org.mozilla.firefox',
  //           // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
  //           'com.microsoft.emmx',
  //         ],
  //       ),
  //     );
  //   } catch (e) {
  //     // An exception is thrown if browser app is not installed on Android device.
  //     debugPrint(e.toString());
  //   }
  // }

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
                  builder: (context) => FeedbackForm(deptName, 'Scheme Type:'),
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
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              // TODO: Uncomment this after the icons are uploaded to Firebase
                              child: Image.network(
                                imageLink,
                                fit: BoxFit.cover,
                                scale: 1.2,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                deptName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'PARENT DEPARTMENT ',
                              style: TextStyle(
                                color: Colors.purple[100],
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              parentDept,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 18,
                              ),
                            ),
                          ],
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
