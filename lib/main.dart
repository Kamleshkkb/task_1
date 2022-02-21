import 'dart:async';
import 'dart:convert';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

 createAlbum(String name,String age,String college,String documents,String numbers,String githublink ) async {
  final response = await http.post(
    Uri.parse('https://custom-web-api.herokuapp.com/api/v1/users'),
    headers: <String, String>{
     // 'Content-Type': 'application/json; charset=UTF-8',
      'emailID':'bgg@gmail.com',
      'rollNO':'005'

    },
    body: jsonEncode(<String, String>{
      'name':name,
      'age':age,
      'college':college,
      'documents':documents,
      'mobileNumber':numbers,
      'githubLink':githublink,
    }),
  );

  if (response.statusCode == 201) {
   
  } else {
    
    throw Exception('Failed to create album.');
  }
}
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nametxt=TextEditingController();
  TextEditingController agetxt=TextEditingController();
  TextEditingController collegetxt=TextEditingController();
  TextEditingController documentstxt=TextEditingController();
  TextEditingController mobiletxt=TextEditingController();
  TextEditingController githubtxt=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text("task 1"),),
        body: Column(
          children: [
            TextField(
              controller: nametxt,
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
            TextField(
              controller: agetxt,
              decoration: InputDecoration(
                hintText: "Age",
              ),
            ),
            TextField(
              controller: collegetxt,
              decoration: InputDecoration(
                hintText: "college",
              ),
            ),
            TextField(
              controller: documentstxt,
              decoration: InputDecoration(
                hintText: "documents",
              ),
            ),
            TextField(
              controller: mobiletxt,
              decoration: InputDecoration(
                hintText: "Mobile Number",
              ),
            ),
            TextField(
              controller: githubtxt,
              decoration: InputDecoration(
                hintText: "Github Link",
              ),
            ),
            FlatButton(
              color:Colors.blue,
              onPressed: (){
              createAlbum(nametxt.text, agetxt.text , collegetxt.text , documentstxt.text , mobiletxt.text , githubtxt.text);
                print(nametxt.text);
                 print(agetxt.text);
                  print(collegetxt.text);
                   print(documentstxt.text);
                    print(mobiletxt.text);
                     print(githubtxt.text);
                     nametxt.clear();
                     agetxt.clear();
                     collegetxt.clear();
                     documentstxt.clear();
                     mobiletxt.clear();
                     githubtxt.clear();
            }, child: Text("Submit API"))
          ],
        ),
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() {
//     return _MyAppState();
//   }
// }

// class _MyAppState extends State<MyApp> {
//   final TextEditingController _controller = TextEditingController();
//  // Future<Album>? _futureAlbum;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Create Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Create Data Example'),
//         ),
//         body: Container(
//           alignment: Alignment.center,
//           padding: const EdgeInsets.all(8.0),
//           child:// (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
//         ),
//       ),
//     );
//   }
//   }

//   // FutureBuilder<Album> buildFutureBuilder() {
//   //   return FutureBuilder<Album>(
//   //     future: _futureAlbum,
//   //     builder: (context, snapshot) {
//   //       if (snapshot.hasData) {
//   //         return Text(snapshot.data!.title);
//   //       } else if (snapshot.hasError) {
//   //         return Text('${snapshot.error}');
//   //       }

//   //       return const CircularProgressIndicator();
//   //     },
//   //   );
//   }
// }