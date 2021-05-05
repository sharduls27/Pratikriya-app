import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pratikriya/sign_in.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FeedbackForm extends StatefulWidget {
  final String deptName;
  final String type;
  final String docID;
  final double totalRating;
  FeedbackForm(this.deptName, this.type, {this.docID, this.totalRating});

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var rating = 0.0;

  bool _autoValidate = false;

  FocusNode _productFocusNode = FocusNode();

  String newFeedback;

  double updatedRating;

  String validateDescription(String value) {
    if (value.length == 0)
      return 'Description cannot be empty';
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

  String validateRating(double value) {
    if (value == null)
      return 'Please give some ratings';
    else
      return null;
  }

  void _updateTotalRating() async {
    DocumentReference documentReferencer =
        documentReference.collection('departments').document(widget.docID);

    Map<String, dynamic> data = <String, dynamic>{
      "total_rating": updatedRating,
    };

    await documentReferencer.updateData(data).whenComplete(() {
      print("Total rating updated");
    }).catchError((e) => print(e));
  }

  void _addFeedback() async {
    DocumentReference documentReferencer =
        documentReference.collection('user_feedback').document();

    Map<String, dynamic> data = <String, dynamic>{
      "department": widget.deptName,
      "desc": newFeedback,
      "down_votes": 0,
      "up_votes": 0,
      "rating": rating,
      "name": name,
    };

    await documentReferencer.setData(data).whenComplete(() {
      print("Feedback added");
    }).catchError((e) => print(e));
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
              _validateInputs();
              if (newFeedback != null && rating != null) {
                if (widget.totalRating != 0) {
                  setState(() {
                    updatedRating = (widget.totalRating + rating) / 2;
                  });
                } else {
                  setState(() {
                    updatedRating = rating;
                  });
                }

                _addFeedback();

                if (widget.docID != null) {
                  _updateTotalRating();
                }

                setState(() {
                  newFeedback = null;
                  rating = 0.0;
                });
                Navigator.of(context).pop(context);
              }
              print(newFeedback);
              print(rating);
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => FeedbackForm(deptName),
              //   ),
              // );
            },
            icon: Icon(
              Icons.send,
              size: 30,
            ),
            label: Text(
              'SUBMIT',
              style: TextStyle(fontSize: 25),
            ),
            isExtended: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Feedback Form',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.type,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[100],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.deptName,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.purple[50],
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: Container(
                        child: TextFormField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          cursorColor: Colors.purple[200],
                          style:
                              TextStyle(fontSize: 18, color: Colors.purple[50]),
                          focusNode: _productFocusNode,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: const InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white54, width: 1),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              hintText: 'Enter feedback description',
                              hintStyle: TextStyle(
                                  fontSize: 20.0, color: Colors.white54),
                              helperStyle: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                              labelStyle: TextStyle(
                                  fontSize: 18, color: Colors.white70),
                              labelText: 'Feedback description',
                              focusColor: Colors.white,
                              hoverColor: Colors.white),
                          validator: validateDescription,
                          textInputAction: TextInputAction.done,
                          onSaved: (val) {
                            newFeedback = val;
                            _productFocusNode.unfocus();
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Enter your rating: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[100],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: SmoothStarRating(
                        allowHalfRating: false,
                        onRatingChanged: (v) {
                          setState(() {
                            rating = v;
                            validateRating(rating);
                          });
                        },
                        starCount: 5,
                        rating: rating,
                        size: 40.0,
                        color: Colors.yellow[600],
                        borderColor: Colors.yellow[800],
                        spacing: 0,
                      ),
                    ),
                    SizedBox(height: 60),
                    // Container(
                    //   child: Center(
                    //     child: FlatButton(
                    //       color: Color(0xFFF6711D),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20),
                    //       ),
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(
                    //           left: 20,
                    //           right: 20,
                    //           top: 10,
                    //           bottom: 10,
                    //         ),
                    //         child: Text(
                    //           'SAVE',
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 25,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //       ),
                    //       onPressed: () {
                    //         _validateInputs();
                    //         if (newProduct != null && newRewardPoint != null) {
                    //           _addProduct();
                    //           setState(() {
                    //             newProduct = null;
                    //             newRewardPoint = null;
                    //           });
                    //           // Navigator.of(context).push(
                    //           //   MaterialPageRoute(
                    //           //     builder: (context) => DashboardScreen(),
                    //           //   ),
                    //           // );
                    //         }
                    //       },
                    //     ),
                    //   ),
                    // ),
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
