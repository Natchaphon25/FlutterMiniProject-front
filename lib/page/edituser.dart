import 'package:flutter/material.dart';
import 'package:mini_project/menu/home_page.dart';
import 'package:mini_project/menu/profile_page.dart';

import '../Services.dart';
import '../home.dart';
import '../main.dart';

class MyEdit extends StatefulWidget {
  MyEdit({Key? key}) : super(key: key);

  @override
  _MyEditState createState() => _MyEditState();
}

class _MyEditState extends State<MyEdit> {
  TextEditingController nameController =
      TextEditingController(text: MyApp.loginUserData.name);
  TextEditingController emailController =
      TextEditingController(text: MyApp.loginUserData.email);
  TextEditingController phoneController =
      TextEditingController(text: MyApp.loginUserData.phone);

  void updateHandle() {
    String name = nameController.text;
    String email = emailController.text;
    String phone = phoneController.text;

    print(name);

    Services.postUpdate(MyApp.loginUserData.uid.toInt(), name, email, phone)
        .then((responseFromServer) {
      setState(() {
        if (responseFromServer == "success") {
          // Services.getUser(MyApp.loginUserData.uid.toInt());
          showUpdateSuccessDialog(context);

          Future.delayed(const Duration(seconds: 1), () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            //       MaterialPageRoute(builder: (context) => MyHomePage()));
            //
          });
        }
      });
    });
  }

  void showUpdateSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text(
            'Edit Success',
          ),
          content: Text('You have successfully Edited!'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Edit Your User Detail',
        style: TextStyle(
          fontSize: 48,
        ),
      )),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blue],
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'ชื่อ-สกุล',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'อีเมล์',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                      controller: phoneController,
                      decoration: const InputDecoration(
                        labelText: 'เบอร์โทร',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        fixedSize: const Size(300, 20)),
                    onPressed: () {
                      updateHandle();
                    },
                    child: const Text(
                      'ยืนยัน',
                      style: TextStyle(fontSize: 24),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
