import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  Map data;

  Details({this.data});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data["description"]),
        actions: [
          widget.data["completed"]
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                )
              : IconButton(
                  onPressed: null,
                  icon: Icon(Icons.edit),
                ),
        ],
      ),
    );
  }
}
