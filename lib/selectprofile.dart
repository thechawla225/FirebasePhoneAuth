import 'package:flutter/material.dart';

enum profile { Shipper, Transporter }

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  profile _character = profile.Shipper;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height:MediaQuery.of(context).size.height*0.05),
                Text(
                  "Please select your profile",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * .90,
                    height: 100,
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Radio<profile>(
                            activeColor: Color.fromARGB(255,46,59,98),
                            value: profile.Shipper,
                            groupValue: _character,
                            onChanged: (profile value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        Container(
                            height: 45,
                            width: 45,
                            child: Image(
                                image: AssetImage('assets/images/house.png'))),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                'Shipper',
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Lorem ipsum dolor sit amet,',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.blueGrey),
                              ),
                              Text(
                                'consectetur adipisicing',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.blueGrey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * .90,
                    height: 100,
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Radio<profile>(
                            activeColor: Color.fromARGB(255,46,59,98),
                            value: profile.Transporter,
                            groupValue: _character,
                            onChanged: (profile value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        Container(
                            height: 45,
                            width: 45,
                            child: Image(
                                image: AssetImage('assets/images/truck.png'))),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                'Transporter',
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Lorem ipsum dolor sit amet,',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.blueGrey),
                              ),
                              Text(
                                'consectetur adipisicing',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.blueGrey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .90,
                  height: 55,
                  color: Color.fromARGB(255,46,59,98),
                  child: Center(
                      child: Text(
                    "CONTINUE",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
                ),
              ],
            ),
          ),
        ));
  }
}
