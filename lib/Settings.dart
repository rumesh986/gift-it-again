import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        actions: [
          IconButton(
            icon: Icon(Icons.help), 
            onPressed: (){}
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
           Row(
             children: [
              Text("Theme"),
              Spacer(),
              ElevatedButton(
                 onPressed: (){}, 
                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                 child: null
              ),
              Spacer(),
              ElevatedButton(
                 onPressed: (){}, 
                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
                 child: null
              ),
              Spacer(),
              ElevatedButton(
                 onPressed: (){}, 
                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                 child: null
              ),
              Spacer(),
              ElevatedButton(
                 onPressed: (){}, 
                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)),
                 child: null
              ),
              Spacer(),
             ],
            )
        ]
       
      ),  
    );
  }
}
