import 'package:flutter/material.dart';

Widget ratingBlock(double rating) {
  int cellingRating = rating.floor();

  switch (cellingRating) {
    case 1:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.star, color: Colors.yellow, size: 40),
          Icon(Icons.star_border, color: Colors.yellow, size: 40),
          Icon(Icons.star_border, color: Colors.yellow, size: 40),
          Icon(Icons.star_border, color: Colors.yellow, size: 40),
          Icon(Icons.star_border, color: Colors.yellow, size: 40),
          SizedBox(width: 10),
          Text(
            rating.toString(),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      );
      break;
    case 2:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.star, color: Colors.yellow, size: 40),
          Icon(Icons.star, color: Colors.yellow, size: 40),
          Icon(Icons.star_border, color: Colors.yellow, size: 40),
          Icon(Icons.star_border, color: Colors.yellow, size: 40),
          Icon(Icons.star_border, color: Colors.yellow, size: 40),
          SizedBox(width: 10),
          Text(
            rating.toString(),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      );
      break;
    case 3:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.star, color: Colors.yellow, size: 40),
          Icon(Icons.star, color: Colors.yellow, size: 40),
          Icon(Icons.star, color: Colors.yellow, size: 40),
          Icon(Icons.star_border, color: Colors.yellow, size: 40),
          Icon(Icons.star_border, color: Colors.yellow, size: 40),
          SizedBox(width: 10),
          Text(
            rating.toString(),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      );
      break;
    case 4:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.star, color: Colors.yellow, size: 40),
          Icon(Icons.star, color: Colors.yellow, size: 40),
          Icon(Icons.star, color: Colors.yellow, size: 40),
          Icon(Icons.star, color: Colors.yellow, size: 40),
          Icon(Icons.star_border, color: Colors.yellow, size: 40),
          SizedBox(width: 10),
          Text(
            rating.toString(),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      );
      break;
    case 5:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.star, color: Colors.yellow, size: 40),
          Icon(Icons.star, color: Colors.yellow, size: 40),
          Icon(Icons.star, color: Colors.yellow, size: 40),
          Icon(Icons.star, color: Colors.yellow, size: 40),
          Icon(Icons.star, color: Colors.yellow, size: 40),
          SizedBox(width: 10),
          Text(
            rating.toString(),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      );
      break;
    default:
      return Row();
      break;
  }
}
