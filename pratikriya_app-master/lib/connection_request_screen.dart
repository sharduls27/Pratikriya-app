import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class ConnectionRequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF00008b),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 250,
                child: FlareActor(
                  "assets/images/no_connection.flr",
                  alignment: Alignment.center,
                  animation: "no_connection",
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "NO CONNECTION",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}
