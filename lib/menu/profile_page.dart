import 'package:flutter/material.dart';
import 'package:mini_project/main.dart';
import 'package:mini_project/models/index.dart';
import 'package:mini_project/page/edituser.dart';

import '../Services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserData data = UserData();
  bool isLoading = false;

  void setData() {
    if (MyApp.isLogin == true && MyApp.loginUserData != null) {
      setState(() {
        Services.getUser(MyApp.loginUserData.uid.toInt())
            .then((responseFromServer) {
          setState(() {
            MyApp.loginUserData.name = responseFromServer.name;
            MyApp.loginUserData.email = responseFromServer.email;
            MyApp.loginUserData.phone = responseFromServer.phone;
          });
        });
        data = MyApp.loginUserData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    setData();
    isLoading = false;
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   isLoading = true;
  //   Services.getUser(MyApp.loginUserData.uid.toInt())
  //       .then((responseFromServer) {
  //     setState(() {
  //       MyApp.loginUserData.name = responseFromServer.name;
  //       MyApp.loginUserData.email = responseFromServer.email;
  //       MyApp.loginUserData.phone = responseFromServer.phone;
  //     });
  //   });
  //   setData();
  //   isLoading = false;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color.fromARGB(255, 62, 62, 62)],
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: <Widget>[
                  Icon(
                    Icons.person,
                    size: 200,
                  ),
                  if (MyApp.isLogin == true && MyApp.loginUserData != null)
                    Column(
                      children: <Widget>[
                        Text(
                          data.username,
                          style: const TextStyle(
                              fontSize: 28, color: Colors.white),
                        ),
                        Text(
                          "Name: ${data.name}",
                          style: const TextStyle(
                              fontSize: 28, color: Colors.white),
                        ),
                        Text(
                          "Email: ${data.email}",
                          style: const TextStyle(
                              fontSize: 28, color: Colors.white),
                        ),
                        Text(
                          "phone: ${data.phone}",
                          style: const TextStyle(
                              fontSize: 28, color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MyEdit()));
                            },
                            icon: Icon(Icons.edit))
                      ],
                    )
                ],
              ),
      ),
    );
  }
}
