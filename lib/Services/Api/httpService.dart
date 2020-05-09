import 'dart:convert';
import 'package:http/http.dart';
class HttpService{
  String url =
          'https://ajith-holy-bible.p.rapidapi.com/GetChapter?Book=Luke&chapter=8';
  // Future

} 
// Future<String> makeRequest() async {
//       print('fetching');
//       String url =
//           'https://ajith-holy-bible.p.rapidapi.com/GetChapter?Book=Luke&chapter=8';
//       var response = await http.get(Uri.encodeFull(url), headers: {
        
//         "x-rapidapi-host": "ajith-holy-bible.p.rapidapi.com",
//         "x-rapidapi-key": "99cc147856msh74933134b391c20p1d97b4jsn5ca11ec7e543"
//       });
//       if (response.statusCode == 200) {
//        print(response.body);
//       }
//        else {
//     print('Request failed with status: ${response.statusCode}.');
//   }
//     }