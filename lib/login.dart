import 'package:flutter/material.dart';
import 'package:mini_project/main.dart';
import 'package:mini_project/models/index.dart';
import 'register.dart';
import 'Services.dart';
import 'models/userData.dart';
import 'home.dart';

class MyLogin extends StatefulWidget {
  MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void handleLogin() {
    // print("Loading......................................................");
    String username = usernameController.text;
    String password = passwordController.text;
    UserData userdata = UserData();
    Services.postLogin(username, password).then((userDataFromServer) {
      setState(() {
        userdata = userDataFromServer;
        print(MyApp.isLogin);

        if (MyApp.isLogin == true) {
          // print("HeloooooooooKKKKKKKk");

          MyApp.loginUserData = userdata;
          print(MyApp.loginUserData.username);

          showLoginSuccessDialog(context);
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    MyFirstPage(title: "Flutter Demo HomePage")));
          });
          
        } else {
          print("FFFFFFFFFFFFFFFFFFFFF");
        }
      });
    });
  }

  void showLoginSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Login Success', style: TextStyle(fontSize: 24),),
          content: Text('You have successfully logged in!'),

      
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(),
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
                Image.network(
                  'https://static.thenounproject.com/png/381038-200.png',
                  width: 300,
                  height: 200,
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: TextFormField(
                      controller: usernameController,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
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
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: TextFormField(
                      controller: passwordController,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        fixedSize: const Size(300, 20)),
                    onPressed: () {
                      print('232555555555');
                      handleLogin();
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 24),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        fixedSize: const Size(300, 20)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyRegister()));
                    },
                    child: const Text(
                      'สมัครสมาชิก',
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
