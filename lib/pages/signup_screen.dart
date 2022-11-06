import 'package:email_auth/email_auth.dart';
import 'package:emailveri/pages/accountcreation_page.dart';
import 'package:emailveri/pages/login_page.dart';
import 'package:emailveri/pages/otp_verification.dart';
import 'package:emailveri/pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Signup_page extends StatelessWidget {
  Signup_page({super.key});
  final _emailcontroller = TextEditingController();
  final _Otpcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void sendotp() async {
      try {
        EmailAuth emailAuth = EmailAuth(sessionName: 'OTP VERIFICATION');
        var res = await emailAuth.sendOtp(recipientMail: _emailcontroller.text);
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }

    void verifyotp() async {
      try {
        EmailAuth emailAuth = EmailAuth(sessionName: 'OTP VERIFICATION');
        var verifyres = await emailAuth.validateOtp(
            recipientMail: _emailcontroller.text, userOtp: _Otpcontroller.text);
        if (verifyres) {
          FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text).then((value) {
if(FirebaseAuth.instance.currentUser! == true){

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This Account is already created')));
}else{
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login_inpage()));
}
          });
    

        }
      }on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }

    final SizedBox constantheight = SizedBox(
      height: 13,
    );
    final Size screensize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: screensize.width * 0.3,
                width: screensize.width * 0.3,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://yt3.ggpht.com/OWAcq1Yu0stdx87oWaZNPMLWYhAyrGhmDTPyi13jlmfAGkkLO5RgYnLGoaXqG_ZOWXCiuqKk=s900-c-k-c0x00ffffff-no-rj'),
                        fit: BoxFit.cover)),
              ),
              constantheight,
              Container(
                width: double.infinity,
                height: 65,
                child: TextFormField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                      suffix: TextButton(
                          onPressed: () {
                            sendotp();
                          },
                          child: Text(
                            'Send OTP',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.deepPurple, width: 2))),
                ),
              ),
              constantheight,
              Container(
                   width: double.infinity,
                height: 65,
                child: TextFormField(
                  controller: _Otpcontroller,
                  decoration: InputDecoration(
                   
                      hintText: 'Enter OTP',
                      hintStyle:
                          TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.deepPurple, width: 2))),
                ),
              ),
              constantheight,
              TextFormField(
                controller: _passwordcontroller,
                decoration: InputDecoration(
                    hintText: 'Enter Password',
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2))),
              ),
              constantheight,
              ElevatedButton(
                  onPressed: () {
                    verifyotp();
                  },
                  child: Text(
                    'Verify&Signup',
                    style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  )),
                  constantheight,
                  TextButton(onPressed: (){
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login_inpage()));
                  }, child: Text('Login',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),))
            ],
          ),
        ],
      ),
    )));
  }
}
