import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/UIs/HomePage/HomePage.dart';
import 'package:movieapp/UIs/SginUpPage/sginUpPgae.dart';

class SginInPage extends StatefulWidget {
  const SginInPage({super.key});

  @override
  State<SginInPage> createState() => _SginInPageState();
}

class _SginInPageState extends State<SginInPage> {
  @override
  Widget build(BuildContext context) {
    String emaliController = '';
    String passwordController = '';
    return Scaffold(
      
      appBar: AppBar(
        
        title: const Text("Movies"),
        backgroundColor: Colors.blueGrey,
      ),
      body:
      
       SingleChildScrollView(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                    radius: 50,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                          'https://thesmartlocal.com/wp-content/uploads/2013/01/images_easyblog_images_522_Meme-thumb_20130118-062010_1.jpg'),
                    )),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: 250,
                  height: 100,
                  child: TextFormField(
                    onChanged: (value) => {
                      emaliController = value,
                    },
                    obscureText: false,
                    cursorColor: const Color.fromARGB(255, 0, 0, 0),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40))),
                        //focusedBorder: UnderlineInputBorder(),
                        hintText: "User name",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(Icons.person_2,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 250,
                  height: 100,
                  child: TextFormField(
                    onChanged: (value) => {
                      passwordController = value,
                    },
                    obscureText: true,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      //focusedBorder: UnderlineInputBorder(),
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock, color: Colors.black),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return const SginUpPage();
                      // }));
                      // ignore: prefer_interpolation_to_compose_strings
                      // print("=========================" +
                      //     emaliController +
                      //     passwordController);
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emaliController.trim(),
                          password: passwordController.trim(),
                        );
                        print("==================aa");
                        // ignore: use_build_context_synchronously
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return  HomePage();
                        }));
                      } catch (e) {
                        print('somthing wrong $e');
                      }
                    },
                    child: const Text("تسجيل الدخول ")),
                    ElevatedButton(
                    onPressed: () async {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return  HomePage();
                      }));
                    }, child: const Text('SKIP'),),
                    ElevatedButton(
                    onPressed: () async {
                       Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return  const SginUpPage();
                      }));
                    }, child: const Text('Create Account'),), 
              ],
            ),
          ],
             ),
       ),
    );
  }
}
