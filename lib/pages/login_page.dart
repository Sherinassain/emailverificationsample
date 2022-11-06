import 'package:email_auth/email_auth.dart';
import 'package:emailveri/pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Login_inpage extends StatelessWidget {
   Login_inpage({super.key});
  final _emailchecker = TextEditingController();
  final _passwordchecker = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final SizedBox constantheight = SizedBox(height: 13,);
    final Size screensize= MediaQuery.of(context).size;
    return Scaffold(
body: SafeArea(child: Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Column(mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Container(
      height: screensize.width*0.3,
      width: screensize.width*0.3,
      decoration: BoxDecoration(color: Colors.transparent,image: DecorationImage(image: NetworkImage('https://yt3.ggpht.com/OWAcq1Yu0stdx87oWaZNPMLWYhAyrGhmDTPyi13jlmfAGkkLO5RgYnLGoaXqG_ZOWXCiuqKk=s900-c-k-c0x00ffffff-no-rj'),fit: BoxFit.cover)),
    ),
    constantheight,
    TextField(
      controller: _emailchecker,
      decoration: InputDecoration(
      hintText: 'Enter email address',
    hintStyle: TextStyle(fontWeight: FontWeight.w600,color: Colors.grey),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.deepPurple,width: 2))
    ),),
    constantheight,
    TextField(
      controller: _passwordchecker,
      obscureText: true,
      decoration: InputDecoration(
            hintText: 'Enter Password',
    hintStyle: TextStyle(fontWeight: FontWeight.w600,color: Colors.grey),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.deepPurple,width: 2))
    ),),
    constantheight,
    ElevatedButton(onPressed: (){
      FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailchecker.text, password: _passwordchecker.text).then((value) {
        return  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Welcome_page()));
      }).onError((error, stackTrace) {
return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
      });
     
    }, child: Text('Login',style: TextStyle(color: Colors.white),))
  ],
  ),
))

    );
  }
}