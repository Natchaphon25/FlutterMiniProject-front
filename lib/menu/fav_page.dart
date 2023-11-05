import 'package:flutter/material.dart';
import 'package:mini_project/main.dart';

import '../Services.dart';
import '../models/books.dart';
import '../page/bookdetail.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  late Books books;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    // title = 'Loading books...';
    books = Books();

    if (MyApp.isLogin == true) {
      Services.getFavBooks(MyApp.loginUserData.uid.toInt())
          .then((booksFromServer) {
        setState(() {
          books = booksFromServer;
          // random();
          isLoading = false;
          // title = widget.title;
        });
      });
    } else {
      isLoading = false;
    }
  }

  Widget list() {
    return Expanded(
      child: ListView.builder(
        // scrollDirection: Axis.horizontal,
        itemCount: books.books == null ? 0 : books.books.length,
        itemBuilder: (BuildContext context, int index) {
          return row(index);
        },
      ),
    );
  }

  Widget row(int index) {
    return Container(
        constraints: BoxConstraints(
          minHeight: 100, // กำหนดความสูงของ Card
        ),
        color: const Color.fromARGB(255, 42, 42, 42),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BookDetail(
                        book: books!.books[index],
                      )));
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => const PDFViewerPage()));
            },
            child: Card(
              color: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      height: 150,
                      child: Image.network("${books!.books[index].bookPic}"),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "${books!.books[index].bookName}",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favarite Books'),
        backgroundColor: Color.fromARGB(255, 29, 29, 29),
        foregroundColor: Colors.amberAccent,
      ),
      body: Container(
          color: Colors.black87,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              if (MyApp.isLogin == true) list(),
            ],
          )),
    );
  }
}
