//import 'package:doctor/main.dart';
import 'package:flutter/material.dart';
import 'package:doctor/listing.dart';
import 'package:shared_preferences/shared_preferences.dart';



class DoctorData{
  List<String> name = [];
  List<String> gender = [];
  List<String> location = [];
  List<String> description = [];
  List<int> phone = [];
  List<String> web = [];
  List<String> email = [];
  List<String> workinghours = [];
  List<String> specialization = [];
  String nameinput;
  String genderinput;
  String locationinput;
  String descriptioninput;
  int phoneinput;
  String webinput;
  String workinghoursinput;
  String specializationinput;
  
}

var doctoractivity = new DoctorData(); 


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
     sharedPreferences = await SharedPreferences.getInstance();
     if(sharedPreferences.getString('token') == null) {
       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LogInScreen()), (Route<dynamic> route) => true);
     }
  }*/
  TextEditingController searchController = new TextEditingController();
  void initState()
  {
    //initSharedPreferences();
    super.initState();
    setState(() {
      //AddListing();
      loadData();
    });
  }
  Future<void> savedata() async{
    print("saved");
    
    SharedPreferences preferences = await SharedPreferences.getInstance();
    
    await preferences.setStringList('name',doctoractivity.name);
    await preferences.setStringList('gender',doctoractivity.gender);
    await preferences.setStringList('location',doctoractivity.location);
    await preferences.setStringList('specialization',doctoractivity.specialization);
     
    
  }
  Future<void> loadData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("Loaded");
    setState(() {
      doctoractivity.name = preferences.getStringList('name').toList();
      doctoractivity.gender = preferences.getStringList('gender').toList();
      doctoractivity.location = preferences.getStringList('location').toList();
      doctoractivity.specialization = preferences.getStringList('specialization').toList();

      print(doctoractivity.name);
      print(doctoractivity.gender);
      print(doctoractivity.location);
      print(doctoractivity.specialization);
    });

  }

  void setData() {
    print("seted");
    //List new
    loadData().then((newname) {
      setState(() {
        newname = doctoractivity.name;
      });
    });
    loadData().then((newgender) {
      setState(() {
        newgender = doctoractivity.gender;
      });
    });
    loadData().then((newlocation) {
      setState(() {
        newlocation = doctoractivity.location;
      });
    });
    loadData().then((newspecialization) {
      setState(() {
        newspecialization = doctoractivity.specialization;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,        
        backgroundColor: Colors.orangeAccent,
        body: Container(
          padding: EdgeInsets.only(right: 10,left: 10),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                  flex: 1,
                  child: Container(
                    width: 43,
                    child: Stack(
                      children: <Widget>[
                        Icon(Icons.brightness_1,size: 30,color: Colors.black,),
                        Positioned(
                          left: 18,
                          child: Icon(Icons.brightness_2,size: 30,color: Colors.black,),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: -1,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context){
                            return AddListing();
                          }));
                    },
                    child: Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2,color: Colors.black),
                      ),
                      child: Icon(Icons.add,size: 25,color: Colors.black,),
                    ),
                  )
                ),          
                ],
              ),
              SizedBox(height: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Find Your Desired",style: TextStyle(color: Colors.black87,fontSize: 25,fontWeight: FontWeight.w800),),
                  Text("Doctor",style: TextStyle(color: Colors.black87, fontSize: 25,fontWeight: FontWeight.w800),),
                ],
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Colors.green[100],
                  child: TextFormField(
                    controller: searchController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(icon: Icon(Icons.search,color: Colors.black)),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              SizedBox(height:10),
              Column(
                children: <Widget>[
                  getList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget getList() {
    return Column(
      children: <Widget>[
        Container(
                          //margin: EdgeInsets.only(left: 10),
                          height: 350,
                          width: 340,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,

                            itemCount: doctoractivity.name.length,
                            itemBuilder: (context,int index) {
                              return Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(top: 10, bottom: 10),
                                    margin: EdgeInsets.only(right: 15,top: 10),
                                    width: 360,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.orangeAccent,
                                          blurRadius: 10,
                                          spreadRadius: 4,
                                          //offset: Offset(0.0,8.0),
                                        ),
                                      ],
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      
                                      child: Stack(
                                        fit: StackFit.loose,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Padding(padding: EdgeInsets.only(left:5)),
                                              Icon(doctoractivity.gender[index] == "male" ? Icons.account_circle : Icons.account_box,size: 50),
                                              Padding(padding: EdgeInsets.only(left:15)),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(doctoractivity.name[index],style: TextStyle(color: Colors.black,fontSize: 25),),
                                                  Row(
                                                    children: <Widget>[
                                                      Text(doctoractivity.specialization[index],style: TextStyle(color: Colors.black)),
                                                      Text(" - ",style: TextStyle(color: Colors.black)),
                                                      Text(doctoractivity.location[index],style: TextStyle(color: Colors.black)),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Padding(padding: EdgeInsets.only(left:50)),
                                              Column(
                                                children: <Widget>[
                                                  FlatButton(
                                                    child: CircleAvatar(
                                                      backgroundColor: Colors.red[50],
                                                      child: Icon(Icons.delete_forever,size: 30,color: Colors.red[700],),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        doctoractivity.name.removeAt(index);
                                                        doctoractivity.gender.removeAt(index);
                                                        doctoractivity.location.removeAt(index);
                                                        doctoractivity.specialization.removeAt(index);
                                                        savedata();
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ]
                                          )
                                      ], 
                                      ),
                                      
                                    ),
                                  ),
                                  
                                ],
                              );
                            }
                          ),
                        ),
      ],
    );
  }
}