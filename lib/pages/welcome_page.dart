import 'package:emailveri/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Welcome_page extends StatelessWidget {
  const Welcome_page({super.key});

  @override
  Widget build(BuildContext context) {
        final SizedBox constantheight = SizedBox(height: 13,);
    final Size screensize= MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: Padding(
        padding:  EdgeInsets.only(left: screensize.width*0.18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Container(
        height: screensize.width*0.3,
        width: screensize.width*0.3,
        decoration: BoxDecoration(color: Colors.transparent,image: DecorationImage(image: NetworkImage('https://yt3.ggpht.com/OWAcq1Yu0stdx87oWaZNPMLWYhAyrGhmDTPyi13jlmfAGkkLO5RgYnLGoaXqG_ZOWXCiuqKk=s900-c-k-c0x00ffffff-no-rj'),fit: BoxFit.cover)),
          ),
          constantheight,
          Text('You are successfully login',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600),)
,          Text('For more deatils pls call +91983647382',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600),)
,constantheight,
  ElevatedButton(onPressed: (){
    FirebaseAuth.instance.signOut().then((value) {
      return   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login_inpage()));
    }).onError((error, stackTrace) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    });
    
    }, child: Text('Logout',style: TextStyle(color: Colors.white),))
          ],
        ),
      )),
    );
  }
}