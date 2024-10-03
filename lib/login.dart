import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_app/dashboard.dart';
import 'package:spotify_app/register.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'LOGIN PAGE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String uEmail = "", getEmail = "", uPassword = "", getPassword = "";

  void login() async {
    final SharedPreferences sh = await SharedPreferences.getInstance();

    setState(() {
      getEmail = uEmail;
      getPassword = uPassword;

      String shared_email = sh.getString("email").toString();
      String shared_password = sh.getString("password").toString();

      print(shared_email);
      print(shared_password);

      if (getEmail == shared_email && getPassword == shared_password) {
        Navigator.push(context, MaterialPageRoute(builder: (a) => Dashboard()));
      } else {
        print("Invalid Email & Password");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "LOGIN PAGE",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      // Icon(Icons.person, size: 30),
                      SizedBox(width: 10),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: TextField(
                    onChanged: (a) => uEmail = a,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: " Enter Your Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: TextField(
                    onChanged: (a) => uPassword = a,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: " Enter Your Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: login,
                    child: Text("LOGIN"),
                    style: ElevatedButton.styleFrom(
                      elevation: 15,
                      backgroundColor: Color.fromARGB(255, 76, 57, 255),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (a) => Register()));
                    },
                    child: Text("REGISTER"),
                    style: ElevatedButton.styleFrom(
                      elevation: 15,
                      backgroundColor: Color.fromARGB(255, 76, 57, 255),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}
