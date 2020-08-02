import 'package:flutter/material.dart';
import 'package:doctor/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddListing extends StatefulWidget {
  @override
  _AddListingState createState() => _AddListingState();
}

class _AddListingState extends State<AddListing> {
  final _formkey = GlobalKey<FormState>();
  var objadd = new AddListing();
  //@override
  
  Future<void> savedata() async{
    print("saved");
    
    SharedPreferences preferences = await SharedPreferences.getInstance();
    
    await preferences.setStringList('name',doctoractivity.name);
    await preferences.setStringList('gender',doctoractivity.gender);
    await preferences.setStringList('location',doctoractivity.location);
    await preferences.setStringList('specialization',doctoractivity.specialization);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orangeAccent,
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20,top: 20,), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                BackButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context,MaterialPageRoute(builder: (context){
                      return HomePage();
                    }));
                  },
                ) 
              ],
            ),
            SizedBox(height: 30,),

            Center(
              child: Container(
                margin: EdgeInsets.only(right: 8),
                height: 370,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10,
                      spreadRadius: 4,
                      offset: Offset(4.0,4.0),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Stack(
                    fit: StackFit.loose,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(hintText: "Name",hoverColor: Colors.blue,),
                                keyboardType: TextInputType.text,
                                maxLength: 30,
                                autofocus: true,
                                onChanged: (String namevalue) {
                                    doctoractivity.nameinput = namevalue;
                                },
                                validator: (actvalue)
                                {
                                  if(actvalue.isEmpty)
                                  {
                                    return 'Please enter something';
                                  }
                                  return null;
                                },
                                
                              ),
                              TextFormField(
                                decoration: InputDecoration(hintText: "Gender",hoverColor: Colors.blue),
                                keyboardType: TextInputType.text,
                                onChanged: (String gendervalue) {
                                  doctoractivity.genderinput = gendervalue;
                                },
                                maxLength: 30,
                                validator: (sumvalue)
                                {
                                  if(sumvalue.isEmpty)
                                  {
                                    return 'Please enter something';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                decoration: InputDecoration(hintText: "Location",hoverColor: Colors.blue),
                                keyboardType: TextInputType.text,
                                onChanged: (String locationvalue) {
                                  doctoractivity.locationinput = locationvalue;
                                  
                                },
                                maxLength: 15,
                                validator: (statvalue)
                                {
                                  if(statvalue.isEmpty)
                                  {
                                    return 'Please enter something';
                                  }
                                  return null;
                                },
                                
                              ),
                              TextFormField(
                                decoration: InputDecoration(hintText: "Specialization",hoverColor: Colors.blue),
                                keyboardType: TextInputType.text,
                                onChanged: (String specializationvalue) {
                                  doctoractivity.specializationinput = specializationvalue;
                                },
                                maxLength: 10,
                                validator: (modvalue)
                                {
                                  if(modvalue.isEmpty)
                                  {
                                    return 'Please enter something';
                                  }
                                  return null;
                                },
                              ),
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(width: 2,color: Colors.blue),
                                  ),
                                  child: FlatButton(
                                    child: Text("Done",
                                      style: TextStyle(
                                        fontSize: 20,fontWeight: FontWeight.w400,color: Colors.blue,
                                      ),
                                    ),
                                    onPressed: () {
                                      if(_formkey.currentState.validate())
                                      {

                                        print("validate data");
                                        Navigator.pop(context,MaterialPageRoute(builder: (context){
                                          return HomePage();
                                        }));
                                        setState(() {
                                        if (doctoractivity.nameinput == null) {
                                          print("can't");
                                        } else {
                                          doctoractivity.name.add(doctoractivity.nameinput);
                                        }

                                        if (doctoractivity.genderinput == null) {
                                          print("can't");
                                        } else {
                                          doctoractivity.gender.add(doctoractivity.genderinput);
                                        }

                                        if (doctoractivity.locationinput == null) {
                                          print("can't");
                                        } else {
                                          doctoractivity.location.add(doctoractivity.locationinput);
                                        }

                                        if (doctoractivity.specializationinput == null) {
                                          print("can't");
                                        } else {
                                          doctoractivity.specialization.add(doctoractivity.specializationinput);
                                        }
                                        savedata();
                                        doctoractivity.nameinput = null;
                                        doctoractivity.genderinput = null;
                                        doctoractivity.locationinput = null;
                                        doctoractivity.specializationinput = null;
                                      });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                   ], 
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}