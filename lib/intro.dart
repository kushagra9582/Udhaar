import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'dashboard.dart';
//void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Image.asset("lib/images/download.png"),
          title: "Live Demo page 1",
          body: "Welcome to Proto Coders Point",
          footer: Text("Footer Text here "),
          decoration: const PageDecoration(
            pageColor: Colors.white,
          )),
      PageViewModel(
        image: Image.asset("lib/images/download.png",scale: 2,),
        title: "Live Demo page 2 ",
        body: "Live Demo Text",
        footer: Text("Footer Text  here "),
      ),
      PageViewModel(
        image: Image.asset("lib/images/download.png"),
        title: "Live Demo page 3",
        body: "Welcome to Proto Coders Point",
        footer: Text("Footer Text  here "),
      ),
      PageViewModel(
        image: Image.asset("lib/images/download.png"),
        title: "Live Demo page 4 ",
        body: "Live Demo Text",
        footer: Text("Footer Text  here "),
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Introduction Screen"),
      ),
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        showNextButton: true,
        showSkipButton: true,
        skip: Text("Skip"),
        done: Text("Got it "),
        onDone: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=>DashBoard(),),);
        },
      ),
    );
  }
}