import 'package:flutter/material.dart';
import 'package:pert9/post_result_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var postResult;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("API"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text((postResult != null)
                ? postResult.id +
                    " | " +
                    postResult.name +
                    " | " +
                    postResult.job +
                    " | " +
                    postResult.created
                : "Tidak Ada Data"),
            RaisedButton(
              onPressed: () {
                PostResult.connectToAPI("Muslim", "Jakarta").then((value) {
                  postResult = value;
                  setState(() {});
                });
              },
              child: Text("GET"),
            )
          ],
        ),
      ),
    ));
  }
}
