import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mini_project/main.dart';
import 'package:mini_project/models/index.dart';
import 'models/book.dart';
import 'models/books.dart';

class Services {
  static const String url = "http://10.160.77.38:8000";

  static Future<bool> chkFavBook(int uid, int bid) async {
    try {
      final response = await http.get(Uri.parse(
          url + '/user/favbooks/' + uid.toString() + "/" + bid.toString()));
      if (200 == response.statusCode) {
        return true;
      } else if (404 == response.statusCode) {
        return false;
      } else {
        return false;
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return false;
    }
  }

  static addOrDeleteFavBook(int uid, int bid) async {
    try {
      Map<String, dynamic> data = {
        'uid': uid,
        'bid': bid,
      };
      final response = await http.post(
        Uri.parse(url + '/favbook/addordelete'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );
      print(response.statusCode);
    } catch (e) {
      print('Error ${e.toString()}');
    }
  }

  static Future<Types> getTypes() async {
    try {
      final response = await http.get(Uri.parse(url + '/booktypes'));
      if (200 == response.statusCode) {
        return parseTypes(response.body);
      } else {
        return Types();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Types();
    }
  }

  static Future<Writers> getWriters() async {
    try {
      final response = await http.get(Uri.parse(url + '/writers'));
      if (200 == response.statusCode) {
        return parseWriters(response.body);
      } else {
        return Writers();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Writers();
    }
  }

  static Future<Books> getFavBooks(int uid) async {
    try {
      final response =
          await http.get(Uri.parse(url + '/favbooks/' + uid.toString()));
      if (200 == response.statusCode) {
        return parseBooks(response.body);
      } else {
        return Books();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Books();
    }
  }

  static Future<Books> getBooks() async {
    try {
      final response = await http.get(Uri.parse(url + '/books'));
      if (200 == response.statusCode) {
        return parseBooks(response.body);
      } else {
        return Books();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Books();
    }
  }

  static Future<Chapters> getBooksChapters(num id) async {
    try {
      final response =
          await http.get(Uri.parse(url + '/books/chapters/' + id.toString()));
      if (200 == response.statusCode) {
        return parseChapters(response.body);
      } else {
        return Chapters();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Chapters();
    }
  }

  static Future<UserData> postLogin(String username, String password) async {
    try {
      // สร้างข้อมูลที่จะส่งไปยังเซิร์ฟเวอร์ในรูปแบบ JSON
      Map<String, dynamic> data = {
        'username': username,
        'password': password,
      };

      final response = await http.post(
        Uri.parse(url + '/user/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (200 == response.statusCode) {
        MyApp.isLogin = true;
        print(MyApp.isLogin);
        print("LoginSuccesssss........");
        return parseUserData(response.body);
      } else {
        return UserData();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return UserData();
    }
  }

  static Future<UserData> getUser(int uid) async {
    try {
      final response =
          await http.get(Uri.parse(url + '/user/' + uid.toString()));
      if (200 == response.statusCode) {
        // UserData responseFromServer = parseUserData(response.body);
        return parseUserData(response.body);
      } else {
        return UserData();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return UserData();
    }
  }

  static Future<String> postRegis(String username, String password, String name,
      String email, String phone) async {
    try {
      // สร้างข้อมูลที่จะส่งไปยังเซิร์ฟเวอร์ในรูปแบบ JSON
      Map<String, dynamic> data = {
        'username': username,
        'password': password,
        'name': name,
        'email': email,
        'phone': phone
      };

      final response = await http.post(
        Uri.parse(url + '/user/register'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (200 == response.statusCode) {
        print("InsertSuccesssss........");
        print(jsonDecode(response.body));

        return "success";
      } else if (422 == response.statusCode) {
        return "422";
      } else {
        return "CannotInsert";
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return "CannotInsert";
    }
  }

  static Future<String> postUpdate(
      int uid, String name, String email, String phone) async {
    try {
      // สร้างข้อมูลที่จะส่งไปยังเซิร์ฟเวอร์ในรูปแบบ JSON
      Map<String, dynamic> data = {
        'uid': uid,
        'name': name,
        'email': email,
        'phone': phone
      };

      final response = await http.post(
        Uri.parse(url + '/user/update'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (200 == response.statusCode) {
        print("UpdateSuccesssss........");
        print(jsonDecode(response.body));

        return "success";
      } else if (404 == response.statusCode) {
        return "404";
      } else {
        return "CannotUpdate";
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return "CannotUpdate";
    }
  }

  static Books parseBooks(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Book> books = parsed.map<Book>((json) => Book.fromJson(json)).toList();
    Books b = Books();
    b.books = books;

    return b;
  }

  static Types parseTypes(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Type> types = parsed.map<Type>((json) => Type.fromJson(json)).toList();
    Types b = Types();
    b.types = types;

    return b;
  }

  static Writers parseWriters(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Writer> writers =
        parsed.map<Writer>((json) => Writer.fromJson(json)).toList();
    Writers b = Writers();
    b.writers = writers;

    return b;
  }

  static UserData parseUserData(String responseBody) {
    final Map<String, dynamic> parsed = json.decode(responseBody);
    UserData ud = UserData.fromJson(parsed);

    return ud;
  }

  static Book parseBook(String responseBody) {
    final Map<String, dynamic> parsed = json.decode(responseBody);
    Book book = Book.fromJson(parsed); // สร้าง Object Book จาก JSON

    return book;
  }

  static Chapters parseChapters(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Chapter> chapters =
        parsed.map<Chapter>((json) => Chapter.fromJson(json)).toList();
    Chapters c = Chapters();
    c.chapters = chapters;

    return c;
  }
}
