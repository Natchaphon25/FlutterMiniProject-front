import 'package:flutter/material.dart';
import 'package:mini_project/main.dart';
import 'package:mini_project/models/index.dart';
import 'pdfshow.dart';
import '../Services.dart';

class BookDetail extends StatefulWidget {
  final Book book;
  const BookDetail({Key? key, required this.book}) : super(key: key);

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  late Book _book;
  late Chapters chapters;
  bool isLoading = false;
  bool favBook = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _book = widget.book; // ส่ง book ไปยัง state โดยใช้ widget.book
    

    Services.getBooksChapters(_book.bid).then((chaptersFromServer) {
      setState(() {
        chapters = chaptersFromServer;
        chkFav();
        isLoading = false;
      });
    });
  }

  void chkFav(){
    if (MyApp.isLogin == true) {
      Services.chkFavBook(MyApp.loginUserData.uid.toInt(), _book.bid.toInt()).then((boolFromServer) {
      setState(() {
        favBook = boolFromServer;
        });
      });
    }
  }

  void addToFavorite() {
    Services.addOrDeleteFavBook(MyApp.loginUserData.uid.toInt(), _book.bid.toInt());
    chkFav();
  }

  Widget list() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chapters.chapters == null ? 0 : chapters.chapters.length,
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
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PDFViewerPage(
                        chapter: chapters!.chapters[index],
                      )));
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => const PDFViewerPage()));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      child: Text("${chapters!.chapters[index].chNum}"),
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
        title: const Text('Book detail'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color.fromARGB(255, 54, 54, 54)],
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
                  Image.network(_book.bookPic,
                      height: 500, width: 350, fit: BoxFit.fill),
                  Text(
                    _book.bookName,
                    style: const TextStyle(fontSize: 28, color: Colors.white),
                  ),
                  Text(
                    "Types: ${_book.typeName}",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "Writers: ${_book.writeName}",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(
                    height: 100,
                    child: list(),
                  ),
                  if (MyApp.isLogin == true && favBook == true)
                    IconButton(
                        onPressed: () {
                          addToFavorite();
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 48,
                          color: Colors.amberAccent,
                        )),
                  if (MyApp.isLogin == true && favBook == false)
                    IconButton(
                        onPressed: () {
                          addToFavorite();
                        },
                        icon: Icon(
                          Icons.favorite_outline,
                          size: 48,
                          color: Colors.amberAccent,
                        )),
                ],
              ),
      ),
    );
  }
}


