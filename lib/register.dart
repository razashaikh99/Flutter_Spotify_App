import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_app/login.dart';

void main() {
  runApp(const Register());
}

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'REGISTER PAGE'),
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
  String getName = "", getEmail = "", getPassword = "";
  String namee = "", email = "", password = "";

  void save_data() async {
    final SharedPreferences sh = await SharedPreferences.getInstance();

    setState(() {
      namee = getName;
      email = getEmail;
      password = getPassword;

      sh.setString('name', namee);
      sh.setString('email', email);
      sh.setString('password', password);

      Navigator.push(
      context, MaterialPageRoute(builder: (a) => Login()));
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
                        "REGISTER PAGE",
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
                    onChanged: (a) => getName = a,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: " Enter Your Name",
                      labelText: "Enter Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_2_outlined),
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
                    onChanged: (a) => getEmail = a,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: " Enter Your Email",
                      labelText: "Enter Email",
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
                    onChanged: (a) => getPassword = a,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: " Enter Your Password",
                      labelText: "Enter Password",
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
                    onPressed: save_data,
                    child: Text("LOGIN"),
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
