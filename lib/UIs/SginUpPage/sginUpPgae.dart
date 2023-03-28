import 'package:flutter/material.dart';
import 'package:movieapp/UIs/HomePage/HomePage.dart';

class SginUpPage extends StatefulWidget {
  const SginUpPage({super.key});

  @override
  State<SginUpPage> createState() => _SginUpPage();
}

class _SginUpPage extends State<SginUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("movies"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                radius: 50,
                child: Image.network(
                  'https://nordvpn.com/wp-content/uploads/blog-social-nordvpn-login-and-sign-up-process-explained-1200x628-2.png',
                  fit: BoxFit.cover,
                  height: 80,
                  width: 75,
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: 250,
                height: 70,
                child: TextFormField(
                  obscureText: true,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      //focusedBorder: UnderlineInputBorder(),
                      hintText: "User name",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(Icons.person_2, color: Colors.black),
                      )),
                ),
              ),
              SizedBox(
                width: 250,
                height: 70,
                child: TextFormField(
                  obscureText: true,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    //focusedBorder: UnderlineInputBorder(),
                    hintText: "E-mail",
                    prefixIcon: Icon(Icons.email, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                height: 70,
                child: TextFormField(
                  obscureText: true,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      //focusedBorder: UnderlineInputBorder(),
                      hintText: "Age",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(16.0),
                        // child: Icon(Icons.person_2, color: Colors.black),
                      )),
                ),
              ),
              SizedBox(
                width: 250,
                height: 70,
                child: TextFormField(
                  obscureText: true,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      //focusedBorder: UnderlineInputBorder(),
                      hintText: "favorite",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(Icons.favorite, color: Colors.black),
                      )),
                ),
              ),
              SizedBox(
                width: 250,
                height: 70,
                child: TextFormField(
                  obscureText: true,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      //focusedBorder: UnderlineInputBorder(),
                      hintText: "Password",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(Icons.lock, color: Colors.black),
                      )),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
                  },
                  child: const Text("إنشاء"))
            ],
          ),
        ],
      ),
    );
  }
}
