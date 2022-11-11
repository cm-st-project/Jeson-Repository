import 'package:flutter/material.dart';
import 'pagetwo.dart';
import 'pagethree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(          // Add the 5 lines from here...
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFAB63E7),
          foregroundColor: Color(0xFFFFFFFF),
        ),
      ),                         // ... to here.
      home: const RandomWords(title: 'Home'),
    );
  }
}

class _RandomWordsState extends State<RandomWords> {
  final _biggerFont = const TextStyle(fontSize: 18);
  String _value = " ";

  @override
  Widget build(BuildContext context) {
    //the width will be a media query the asks the machine what the dimensions of the screen are, then we'll steal the width
    MediaQueryData data = MediaQuery.of(context);
    double deviceWidth = data.size.width;
    double deviceHeight = data.size.height;

    double containerHeightRatio = 0.25;

    return Scaffold(
      appBar: AppBar(
        title: DropdownButton<String>(
          value: "Home",
          items: <DropdownMenuItem<String>>[
            DropdownMenuItem(
              child: const Text('Home'),
              value: 'Home',
            ),
            DropdownMenuItem(
                child: const Text('Classes'),
                value: 'Classes'
            ),
            DropdownMenuItem(
                child: const Text('Calendar'),
                value: 'Calendar'
            ),
          ],

          onChanged: (String? value) {
            setState(() => _value = value!);
            if(_value == "Classes"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageTwo(title: "My Classes")),
              );
            }
            if(_value == "Calendar"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageThree(title: "My Calendar")),
              );
            }
          },
        ),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.black12,
              height: deviceHeight-80,
              width: deviceWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Text(
                    "Announcements",
                    style: TextStyle(fontSize: 24),
                  ),
                  Container(
                    color: Colors.white,
                    height: deviceHeight * containerHeightRatio,
                    width: deviceWidth * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //Feel free to customize the look of the font in any way you want
                        Text("-Announce 1"),
                        Text("-Announce 2"),
                      ]
                    )
                  ),
                  Text(
                    "Classes",
                    style: TextStyle(fontSize: 24),
                  ),
                  Container(
                      color: Color(0xffa80e0e),
                      height: deviceHeight * containerHeightRatio,
                      width: deviceWidth * 0.9,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //Feel free to customize the look of the font in any way you want
                            Text("-Class Name"),
                            Text("-Date"),
                            Text("-Information: "),
                          ]
                      )
                  ),
                  Text(
                    "Calendar",
                    style: TextStyle(fontSize: 24),
                  ),
                  Container(
                      color: Colors.white,
                      height: deviceHeight * containerHeightRatio,
                      width: deviceWidth * 0.9,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //Feel free to customize the look of the font in any way you want
                            Text("-Event 1: Date"),
                            Text("-Event 2: Date"),
                            Text("-Event 3: Date"),
                          ]
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<RandomWords> createState() => _RandomWordsState();
}