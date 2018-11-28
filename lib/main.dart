import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    animation.addListener(() {
      setState(() {
        print(animation.value.toString());
      });
    });

    animation.addStatusListener((status) => print(status));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(

        ));
  }
}
