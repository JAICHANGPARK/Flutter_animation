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
//  Animation<double> animation;
  Animation<Color> animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    //animation = Tween<double>(begin: 20.0, end: 100.0).animate(animationController);

    animation = ColorTween(begin: Colors.white, end: Colors.black87)
        .animate(animationController);
//    animation.addListener(() {
//      setState(() {
//        print(animation.value.toString());
//      });
//    });

    animation.addStatusListener((status) => print(status));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedLogo(
        animation: animation,
      ),
//        child: Container(
//          height: 150.0,
//          width: 150.0,
//          color: animation.value,
//          child: FlutterLogo(),
//
//        )
//
        );
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
