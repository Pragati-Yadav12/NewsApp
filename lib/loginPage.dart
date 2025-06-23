import 'package:flutter/material.dart';
class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final emailController=TextEditingController();
  final passwordController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Login Page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Enter Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: "Enter Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))
                  )
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            ElevatedButton.styleFrom(backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))));
          },
              child:Text("Login"))
        ],
      ),
    );
  }
}
