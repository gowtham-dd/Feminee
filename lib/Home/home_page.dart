import 'package:flutter/material.dart';
import 'package:online_cource_app/Detail/course_detail.dart';
import 'package:online_cource_app/Model/model.dart.dart';
import 'package:online_cource_app/Utils/custom_drawer.dart';
import 'package:online_cource_app/chatbot/chatscreen.dart';
import 'package:online_cource_app/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> allCourses = [
      ...onlineCourceOne,
      ...onlineCourceTwo
    ];

    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      appBar: myAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hey Feminee!,",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 15),
            const Text(
              "Get Personalized Recommendations..",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            searchBar(),
            const SizedBox(height: 35),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: primary),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Wrap GridView with Flexible to avoid overflow
            Flexible(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: allCourses.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.6, // Adjust aspect ratio as needed
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoursesDetail(
                            imgDetail: allCourses[index]['img_detail'],
                            title: allCourses[index]['title'],
                            price: allCourses[index]['price'],
                          ),
                        ),
                      );
                    },
                    child: availableCourses(context, allCourses, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Add the floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the ChatScreen
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ChatScreen()), // Make sure to import ChatScreen
          );
        },
        backgroundColor: const Color.fromARGB(
            255, 255, 255, 255), // You can set the color as needed
        child: const Icon(Icons.chat, size: 30),
      ),
    );
  }

  Widget availableCourses(
      BuildContext context, List<Map<String, dynamic>> courses, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.asset(
              courses[index]['img'],
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  courses[index]['title'],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  courses[index]['courses'],
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container searchBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search for anything",
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.25)),
          prefixIcon: const Icon(Icons.search, color: Colors.black54),
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Feminee',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              "https://www.simplilearn.com/ice9/free_resources_article_thumb/how_to_become_A_programmer.jpg",
            ),
          ),
        ],
      ),
    );
  }
}
