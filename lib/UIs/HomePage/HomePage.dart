// ignore: file_names
// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart'
    show CarouselOptions, CarouselSlider;
import 'package:flutter/material.dart';
import 'package:movieapp/Apiserves/ApiMovies.dart';

import '../../Model/ModelMovies.dart';
import 'HomePageLists.dart';
// import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});
  int current_index = 0;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<List<Data>> _listofmovies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listofmovies = featchmovies();
  }
  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    switch (widget.current_index) {
      case 1:
        return Scaffold(
          appBar: AppBar(
            title: const Text("Movies"),
            backgroundColor: Colors.blueGrey,
          ),
          body: FutureBuilder<List<Data>>(
            future: _listofmovies,
            builder: (context, snapshot) {
              
              print("==============================>>>>>>======================");

              if (snapshot.hasData) {
                for (var movie in snapshot.data!) {
                  listofimg.add(movie.img.toString());
                }

                return Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 400,
                      viewportFraction: 0.6,
                      enlargeCenterPage: true,
                      autoPlay: true,
                    ),
                    items: listofimg.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.network(image, fit: BoxFit.cover);
                        },
                      );
                    }).toList(),
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.movie_filter_outlined), label: "Movies"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_2_rounded), label: "Profile"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.logout), label: "Logout"),
              ],
              currentIndex: widget.current_index,
              type: BottomNavigationBarType.fixed,
              onTap: (int index) {
                setState(() {
                  widget.current_index = index;
                });
              }),
        );

      // break;
      default:
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
            backgroundColor: Color.fromRGBO(33, 150, 243, 1),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 400,
                      viewportFraction: 0.6,
                      enlargeCenterPage: true,
                      autoPlay: true,
                    ),
                    items: img.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.network(i, fit: BoxFit.cover);
                        },
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                      itemCount: typeMovie.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext contex, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(4),
                          child: MaterialButton(
                            padding: const EdgeInsets.all(0),
                            minWidth: 0,
                            onPressed: () => {},
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(typeMovie[index].toString()),
                                )),
                          ),
                        );
                      }),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text("Rental"),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                      itemCount: rental.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext contex, int index) {
                        return Container(
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            child:
                                Image.network(rental[index], fit: BoxFit.fill));
                      }),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.movie_filter_outlined), label: "Movies"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_2_rounded), label: "Profile"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.logout), label: "Logout"),
              ],
              currentIndex: widget.current_index,
              type: BottomNavigationBarType.fixed,
              onTap: (int index) {
                setState(() {
                  widget.current_index = index;
                });

                // print(widget.current_index);
              }),
        );
    }
  }
}
