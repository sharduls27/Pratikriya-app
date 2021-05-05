import 'package:flutter/material.dart';
import 'package:pratikriya/home_screen_widgets/department_screen.dart';
import 'package:pratikriya/home_screen_widgets/feedback_form.dart';
import 'package:pratikriya/home_screen_widgets/schemes_screen.dart';

class HomeCardWidget extends StatelessWidget {
  final int navScreenSelection;
  final String cardName;
  const HomeCardWidget(
    this.cardName,
    this.navScreenSelection,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          switch (navScreenSelection) {
            // case 0:
            //   Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (context) => DashboardScreen(),
            //     ),
            //   );
            //   break;

            case 1:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DepartmentScreen(),
                ),
              );
              break;

            case 2:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SchemesScreen(),
                ),
              );
              break;

            case 3:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FeedbackForm('All', 'Department:'),
                ),
              );
              break;
          }
        },
        child: Card(
          color: Color(0xFF00008b),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              cardName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
