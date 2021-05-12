import 'package:flutter/material.dart';
import 'package:liveasytask/enterno.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FirebasePhoneAuthSupporter(child: MaterialApp(debugShowCheckedModeBanner: false, home: MyApp())));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
var currentSelectedValue;
var deviceTypes = ["English", "Hindi", "Tamil"];
  
  @override
  Widget build(BuildContext context) {
    
    
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*0.30,),
              Container(
                  height: 60,
                  width: 60,
                  child: Image(image: AssetImage('assets/images/image.png'))
                  ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Please select you Language",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "You can change the language",
                style: TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
              Text(
                "at any time.",
                style: TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
              SizedBox(height: 30,),
              Container(
                width: 250,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: DropdownButtonHideUnderline(
          child: DropdownButton<String>
          (
            hint: Padding(
              padding: EdgeInsets.only(left: 10), child: Text("English",style: TextStyle(color: Colors.blueGrey),)),
            value: currentSelectedValue,
            isDense: true,
            onChanged: (newValue) {
              setState(() {
                currentSelectedValue = newValue;
              });
              print(currentSelectedValue);
            },
            items: deviceTypes.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(value, style: TextStyle(color: Colors.blueGrey),),
                ),
              );
            }
            ).toList(),
          ),
                )
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: ()
                {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EnterNum()));
                },
                  child: Container(
                  width: 250,
                  height: 55,
                  color: Color.fromARGB(255,46,59,98),
                  child: Center(child: Text("N E X T", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width*0.353,
              ),
              Stack(children: [
                ClipPath(
                  clipper: ProsteBezierCurve(
                    position: ClipPosition.top,
                    list: [
                      BezierCurveSection(
                        start: Offset(screenWidth, 30),
                        top: Offset(screenWidth / 4 * 3, 70),
                        end: Offset(screenWidth / 2, 30),
                      ),
                      BezierCurveSection(
                        start: Offset(screenWidth / 2, 30),
                        top: Offset(screenWidth / 4, 0),
                        end: Offset(0, 30),
                      ),
                    ],
                  ),
                  child: Container(
                    height: 100,
                    color: Color.fromRGBO(148,212,244,5),
                  ),
                ),
                ClipPath(
                  clipper: ProsteBezierCurve(
                    position: ClipPosition.top,
                    list: [
                      BezierCurveSection(
                        start: Offset(screenWidth, 20),
                        top: Offset(screenWidth / 4 * 3, 0),
                        end: Offset(screenWidth / 2, 40),
                      ),
                      BezierCurveSection(
                        start: Offset(screenWidth / 2, 20),
                        top: Offset(screenWidth / 4, 60),
                        end: Offset(0,25),
                      ),
                    ],
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.4),
                    height: 100,
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
