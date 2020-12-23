import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class LogInPage extends StatefulWidget {
  @override
  State createState() => new LogInPageState();
}

class LogInPageState extends State<LogInPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'images/city2.jpg',
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Theme(
                  data: ThemeData(
                    primarySwatch: Colors.teal,
                  ),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: TextStyle(
                              color: Colors.teal,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Email Password',
                            labelStyle: TextStyle(
                              color: Colors.teal,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        MaterialButton(
                          height: 40.0,
                          minWidth: 100.0,
                          onPressed: () {},
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: Icon(
                            Icons.login,
                            size: 30.0,
                          ),
                          splashColor: Colors.red[100],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
