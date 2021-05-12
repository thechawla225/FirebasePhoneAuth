import 'package:flutter/material.dart';
import 'package:liveasytask/otpscreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flag/flag.dart';
import 'otpscreen.dart';

class EnterNum extends StatefulWidget {
  @override
  _EnterNumState createState() => _EnterNumState();
}

class _EnterNumState extends State<EnterNum> {
  String phonenum;

  void saveform() {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
    }
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              MdiIcons.windowClose,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Center(
                  child: Text(
                    "Please enter your mobile number",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "You'll recieve a 4 digit code",
                  style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                ),
                Text(
                  "to verify next.",
                  style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: formkey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * .90,
                          height: 55,
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 20),
                                child: Flag(
                                  'in',
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              Text(
                                "+91 ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Container(
                                  width: 8,
                                  child: Divider(
                                      thickness: 2, color: Colors.black),
                                ),
                              ),
                              Container(
                                width: 180,
                                child: TextFormField(
                                  onSaved: (value) {
                                    phonenum = value;
                                    phonenum = "+91" + phonenum;
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: "Mobile Number",
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                    } else {
                                      if (value.length < 10) {
                                      } else {}
                                    }
                                  },
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          saveform();

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => OtpScreen(phonenum)));
                          
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * .90,
                          height: 55,
                          color: Color.fromARGB(255, 46, 59, 98),
                          child: Center(
                              child: Text(
                            "CONTINUE",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
