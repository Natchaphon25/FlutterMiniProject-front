
import 'Services.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class MyRegister extends StatefulWidget {
  MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void regisHandle(){
    String username = usernameController.text;
    String password = passwordController.text;
    String name = nameController.text;
    String email = emailController.text;
    String phone = phoneController.text;

    Services.postRegis(username, password, name, email, phone).then((responseFromServer){
      setState(() {
        if (responseFromServer == "success"){

          showRegisSuccessDialog(context);
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    MyFirstPage(title: "Flutter Demo HomePage")));
          });

        }
      });
    });



  }
  
 void showRegisSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Register Success', style: TextStyle(fontSize: 24),),
          content: Text('You have successfully Registed!'),

      
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'สมัครสมาชิก',
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
                      controller: usernameController,
                      decoration: const InputDecoration(
                        labelText: 'username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'password',
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
                      regisHandle();
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
