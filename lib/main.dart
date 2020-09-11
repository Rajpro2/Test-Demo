import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jsondemotst/InternetConnection.dart';
import 'package:jsondemotst/model_class.dart';

import 'primary_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JsonListPractise',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Records> jsonList = List<Records>();
  bool _isLoading = false;

  Future<List<Records>> viewallList() async {

    check().then((internet) async{
      if (internet != null && internet) {
        // Internet Present Case
        setState(() {
          _isLoading = true;
        });

        var url = "http://test.chatongo.in/testdata.json";

        Map<String, String> headers = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        };
        var responseJson = null;
        var response = await http.get( url,headers: headers );

        if (response.statusCode == 200) {
          responseJson = json.decode( response.body );
       
          if (responseJson != null) {
            String message = responseJson["Message"];
            setState(() {_isLoading = false;});
            if (message == "Success") {
              Map<String, dynamic> data = responseJson["data"];
              String message = responseJson["TotalRecords"];
              final nammaukList = data["Records"] as List;
              jsonList.clear();
              for (var data in nammaukList) {
                jsonList.add( new Records.fromJson(data));
              }
            }
          }
          return jsonList;
        }else {
          Fluttertoast.showToast(
              msg: "Failed to load json data ",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              textColor: Colors.white,
              fontSize: 16.0);
          setState(() {
            _isLoading = false;
          });
          throw Exception('Failed to load post');

        }

      }
      // No-Internet Case
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewallList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Json data', style: TextStyle(fontSize: 20.0,color: Colors.white),),
      ),
      body:  _isLoading ? Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueAccent),)): ListView.builder(
        itemCount: jsonList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          var recent = jsonList[index];
          return Container(
            width: double.infinity,
            height: 320.0,
            child: CardView(views: recent),
          );
        },
      ),
    );
  }
}

