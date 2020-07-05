import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home : new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final usernameCon = new TextEditingController();
  final passwordCon = new TextEditingController();
  final emailCon = new TextEditingController();

  @override
  Widget build(BuildContext context){
    return new Scaffold(

        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(


              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 100.0, 0, 0),
                    child: Text(
                      'GEDARATAMA',
                      style: TextStyle(
                          fontSize: 30.0 , fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Container(

              padding: EdgeInsets.only(top: 35.0 , left: 20.0 , right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: usernameCon,
                    decoration: InputDecoration(
                        labelText: 'USERNAME',
                        labelStyle: TextStyle(
                            fontFamily: 'BalsamiqSans',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        )
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextField(
                    controller: emailCon,
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'BalsamiqSans',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        )
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextField(
                    controller: passwordCon,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                            fontFamily: 'BalsamiqSans',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        )
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: FlatButton(
                        onPressed: (){testing(usernameCon.text, passwordCon.text, emailCon.text);},
                        child: Center(
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BalsamiqSans'
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  Container(
                    height: 30.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.grey,
                      color: Colors.blueGrey,
                      elevation: 7.0,
                      child: FlatButton(
                        onPressed: (){},
                        child: Center(
                          child: Text(
                            'BACK',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BalsamiqSans'
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}

Future<String> testing(String _username, String _password , String _email) async{
  print("name :  $_username and pass $_password and email $_email");
  String url = 'http://192.168.43.136:8081/customersignup';
  var res = await http.post(url,
      headers: {'Content-Type': "application/x-www-form-urlencoded"},
      body: {
        "password": _password,
        "email": _email,
        "username": _username

      });
  

  return res.body;
}
