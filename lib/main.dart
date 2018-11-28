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
        vsync: this, duration: Duration(milliseconds: 5000));
    //animation = Tween<double>(begin: 20.0, end: 100.0).animate(animationController);

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut);

    animation.addListener(() {
      setState(() {
        print(animation.value.toString());
      });
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
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

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  final Tween<double> _sizeAnim = Tween<double>(begin: 0.0, end: 500.0);

//  final CurvedAnimation _sizeAnim = CurvedAnimation(begin: 0.0, end: 500.0);

  AnimatedLogo({Key key, Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double> animation = listenable;
    return Transform.scale(
      scale: animation.value * 50,
      child: FlutterLogo(),
    );
  }
}

