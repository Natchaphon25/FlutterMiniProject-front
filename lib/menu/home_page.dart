import 'dart:math';

import 'package:flutter/material.dart';
import '../Services.dart';
import '../models/books.dart';
import '../page/bookdetail.dart';
import '../page/pdfshow.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Books books;
  bool isLoading = false;
  // int randomNumber = 0;
  // late String title;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    // title = 'Loading books...';
    books = Books();

    Services.getBooks().then((booksFromServer) {
      setState(() {
        books = booksFromServer;
        // random();
        isLoading = false;
        // title = widget.title;
      });
    });
  }

  // void random() {
  //   Random random = Random();

  //   this.randomNumber = random.nextInt(books.books.length);
  // }

  // Widget list() {
  //   return Expanded(
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: books.books == null ? 0 : books.books.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return row(index);
  //       },
  //     ),
  //   );
  // }

  // Widget row(int index) {
  //   return Container(
  //       constraints: BoxConstraints(
  //         minHeight: 300, // กำหนดความสูงของ Card
  //       ),
  //       child: GestureDetector(
  //           onTap: () {
  //             Navigator.of(context).push(MaterialPageRoute(
  //                 builder: (context) => BookDetail(
  //                       book: books!.books[index],
  //                     )));
  //             // Navigator.of(context)
  //             //     .push(MaterialPageRoute(builder: (context) => const PDFViewerPage()));
  //           },
  //           child: Card(
  //             color: Colors.black12,
  //             child: Padding(
  //               padding: const EdgeInsets.all(10.0),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 // crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   SizedBox(
  //                     // width: 200,
  //                     // height: 200,
  //                     child: Image.network("${books!.books[index].bookPic}"),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           )));
  // }

  Widget grid() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // จำนวนคอลัมน์ใน grid
          crossAxisSpacing: 10, // ระยะห่างระหว่างคอลัมน์
          mainAxisSpacing: 10, // ระยะห่างระหว่างแถว
          mainAxisExtent: 230,
        ),
        itemCount: books.books.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BookDetail(
                    book: books.books[index],
                  ),
                ));
              },
              child: Column(
                children: <Widget>[
                  Container(
                    // height: 180,
                    // width: 120,
                    child: Card(
                      child: Image.network(
                        books.books[index].bookPic,
                        height: 190,
                        
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                      child: Text(
                    books.books[index].bookName,
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis, // ถ้าข้อความเกินให้แสดง ...
                    maxLines: 1,
                  ))
                ],
              ));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Color.fromARGB(255, 29, 29, 29),
        foregroundColor: Colors.amberAccent,
      ),
      body: Container(
          color: Colors.black87,
          padding: const EdgeInsets.all(10.0),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: <Widget>[
                    Column(children: <Widget>[
                      Text(
                        'All books',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ]),
                    grid(),
                  ],
                )),
    );
  }
}
