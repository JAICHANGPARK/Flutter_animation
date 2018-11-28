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
//  Animation<Color> animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    //animation = Tween<double>(begin: 20.0, end: 100.0).animate(animationController);

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController);

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

  final Tween<double> _sizeAnim = Tween<double>(begin: 50.0, end: 100.0);

  AnimatedLogo({Key key, Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double>animation = listenable;
    return Opacity(
      opacity: animation.value,
      child: Container(
        height: _sizeAnim.evaluate(animation),
        width: 100.0,
        child: FlutterLogo(),
      ),
    );
  }
}
