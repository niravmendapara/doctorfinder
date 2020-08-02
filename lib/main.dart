
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:doctor/homepage.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.blueAccent,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image(image: AssetImage("assets/temp_splash.png"),fit: BoxFit.cover,height: 616,width: 640,),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 50,),
                      Text("Choose the Doctor",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w800),),
                      Text("You Want",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w800),),
                      SizedBox(height: 10),
                      Text("Lorem ipsum dolor amet, consectetur",style: TextStyle(color: Colors.white54,fontSize: 15,),),
                      Text("adipiscing inet deli",style: TextStyle(color: Colors.white54,fontSize: 15,),),
                      SizedBox(height: 50),
                      Center(
                        child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(23),
                        color: Colors.orange,
                        child: MaterialButton(
                          child: Container(
                            height: 50,
                            width: 170,
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  Text("Get Started",style: TextStyle(fontSize: 20,color: Colors.black),),
                                ],
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context){
                              return LogInScreen();
                            }));
                          },
                        ),
                    ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _obscureText = true;
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.only(top: 100),
            color: Colors.cyan[200],
            child: Column(
              children: <Widget>[
                Text("Log In Page",style: TextStyle(color: Colors.black,fontSize: 30)),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    height: 270,
                    width: 340,
                    child: Card(
                      child: Container(
                        color: Colors.cyan[200],
                        padding: EdgeInsets.only(left:20,right: 20),
                        child: Column(
                          children: <Widget>[
                            Container(
                            height: 50,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black26,
                            ),
                            
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 5,right: 5),
                                  child: Icon(Icons.supervised_user_circle,color: Colors.white),
                                ),
                                
                                SizedBox(width: 5,),
                                Expanded(
                                  child: TextFormField(
                                    controller: usernameController,
                                    decoration: InputDecoration(hintText: "Username",hintStyle: TextStyle(color: Colors.white),),
                                      keyboardType: TextInputType.text,
                                    ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black26,
                            ),
                            
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 5,right: 5),
                                  child: Icon(Icons.lock,color: Colors.white),
                                ),
                                
                                SizedBox(width: 5,),
                                Expanded(
                                  child: TextFormField(
                                    controller: passwordController,
                                    decoration: InputDecoration(hintText: "Password",hintStyle: TextStyle(color: Colors.white),fillColor: Colors.white),
                                      keyboardType: TextInputType.text,
                                      obscureText: _obscureText,
                                    ),
                                ),
                                IconButton(icon: Icon(Icons.visibility_off,color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                        if(_obscureText == true){
                                          _obscureText = false;
                                        }
                                        else{
                                          _obscureText = true;
                                        }
                                      });
                                  }
                                ),
                              ],
                            ),
                          ),
                            SizedBox(height: 30),
                            Material(
                                    elevation: 8,
                                    borderRadius: BorderRadius.circular(23),
                                    color: Colors.orange,
                                    child: MaterialButton(
                                      child: Container(
                                        height: 50,
                                        width: 170,
                                        child: Center(
                                          child: Text("Sign In",style: TextStyle(fontSize: 20,color: Colors.black),),
                                        ),
                                      ),
                                      onPressed: () {
                                        
                                        signIn(usernameController.text, passwordController.text);
                                        /*Navigator.push(context,MaterialPageRoute(builder: (context){
                                          return LogInScreen();
                                        }));*/
                                      },
                                    ),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
  
    signIn(String username,password) async {
    Map data = {
      'username': username,
      'password': password
    };
    print(data);
    var jsonData;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post('https://slbs21.luckbyspin.in/API/LoginDemo', body: data);
    
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      setState(() {
        //_isLoading = false;
        sharedPreferences.setString("token", jsonData["token"]);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomePage()), (Route<dynamic> route) => false);
      });
    }
    else {
      print(response.body);
    }
  }
}
