import 'package:flutter/material.dart';

class Summary extends StatelessWidget {

  final String option;
  Summary({this.option});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Summary"),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            child: Text("Done"),
          ),
        ),
      ),
    );
  }
}