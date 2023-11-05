import 'package:flutter/material.dart';
import 'Services.dart';
import 'login.dart';
import 'home.dart';
import 'models/types.dart';
import 'models/userData.dart';
import 'models/writers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static bool isLogin = false;
  static UserData loginUserData = UserData();
  // static late Types types;
  // static late Writers writers;

  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 40, 115, 255)),
        useMaterial3: true,
      ),
      home: const MyFirstPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyFirstPage extends StatefulWidget {
  const MyFirstPage({super.key, required this.title});

  final String title;

  @override
  State<MyFirstPage> createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  
  
  void setLogout() {
    setState(() {
      MyApp.isLogin = false;
      MyApp.loginUserData = UserData();
    });
    showLogOutSuccessDialog(context);
    
  }

  void showLogOutSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Logout Success', style: TextStyle(fontSize: 24),),
          content: Text('You have successfully logged out!'),

      
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(

      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.orangeAccent, Colors.white],
            ),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/10/10919.png',
                width: 300,
              ),
              const Text(
                'Book Verse แอปอ่านหนังสือ',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              if (MyApp.isLogin == true)
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        fixedSize: const Size(300, 20)),
                    onPressed: () {
                      setLogout();
                    },
                    child: const Text(
                      'Log out',
                      style: TextStyle(fontSize: 20),
                    )),
              if (MyApp.isLogin == false)
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        fixedSize: const Size(300, 20)),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MyLogin()));
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(fontSize: 20),
                    )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      fixedSize: const Size(300, 20)),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: const Text(
                    'เข้าสู่หน้าหลัก',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
