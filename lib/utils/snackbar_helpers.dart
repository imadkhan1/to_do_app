 import 'package:flutter/material.dart';

void showErrorMessage(BuildContext context, 
 
 // ignore: non_constant_identifier_names
 {required String Message}) {
    final snackBar = SnackBar(
      content: Text(
        Message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }




void showSuccessMessage(BuildContext context,
 // ignore: non_constant_identifier_names
 {required String Message}) {
    final snackBar = SnackBar(
      content: Text(
        Message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }