import 'package:flutter/material.dart';
import 'package:liveasytask/selectprofile.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'enterno.dart';


class OtpScreen extends StatefulWidget {
  final String verid;
  final String pnum;
  final FirebaseAuth auth;

  OtpScreen(this.verid, this.pnum, this.auth);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String message;
  GlobalKey<FormState> formkey2 = GlobalKey<FormState>();
  var otp;

  void signIn(PhoneAuthCredential phoneAuthCredential)
  async{
    try
    {
   final authcredential = await widget.auth.signInWithCredential(phoneAuthCredential);
   if(authcredential.user != null)
   {
     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()));
   }
    }
    on FirebaseAuthException catch (e)
    {
      print("Exception came");
    }

  }

  void saveform()
  {
    if(formkey2.currentState.validate())
    {
      formkey2.currentState.save();
    }
  }

  @override
  void initState() {
    message = "Code is sent to " + widget.pnum;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              MdiIcons.keyboardBackspace,
              color: Colors.black,
            )),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            "Verify Phone",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            message,
            style: TextStyle(fontSize: 15, color: Colors.blueGrey),
          ),
          SizedBox(
            height: 30,
          ),
          Form(

            key: formkey2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PinCodeTextField(
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  activeFillColor: Color.fromRGBO(148,212,244,1),
                  selectedColor: Color.fromRGBO(148,212,244,1),
                  activeColor: Color.fromRGBO(148,212,244,1),
                  disabledColor: Color.fromRGBO(148,212,244,1),
                  inactiveColor: Color.fromRGBO(148,212,244,1),
                  inactiveFillColor: Color.fromRGBO(148,212,244,1),
                  selectedFillColor: Color.fromRGBO(148,212,244,1),
                ),
                backgroundColor: Colors.white,
                keyboardType: TextInputType.number,
                enableActiveFill: true,
                appContext: context,
                length: 6,
                onChanged: (value) {},
                onSaved: (value) {
                  otp = value;
                },
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text(
                  "Didn't recieve the code? ",
                  style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                ),
                Text(
                  " Request Again",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () async{
              saveform();
              PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: widget.verid , smsCode: otp);
              signIn(phoneAuthCredential);
              
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .90,
              height: 55,
              color: Color.fromARGB(255,46,59,98),
              child: Center(
                  child: Text(
                "VERIFY AND CONTINUE",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )),
            ),
          ),
        ])),
      ),
    );
  }
}
