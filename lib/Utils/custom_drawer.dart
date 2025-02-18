import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:online_cource_app/About/about_screen.dart';
import 'package:online_cource_app/Courses/alll_courses.dart';
import 'package:online_cource_app/Courses/enrolled_course.dart';
import 'package:online_cource_app/Exam/exam_home.dart';

import 'package:online_cource_app/Home/home_page.dart';
import 'package:online_cource_app/Intern/allInter.dart';
import 'package:online_cource_app/Login/login_page.dart';

import 'package:online_cource_app/controllers/auth_controller.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white, // Set the background color of the Drawer to white
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color:
                    Colors.white, // Set DrawerHeader background color to white
              ),
              child: Center(
                child: Image.asset(
                  'images/logo1.png', // Replace 'assets/logo.png' with your logo asset path
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(OctIcons.home,
                  color: Colors.black), // Set icon color to black
              title: const Text('Home',
                  style: TextStyle(
                      color: Colors.black)), // Set text color to black
              onTap: () {
                Get.to(() => const MyHomePage());
              },
            ),
            ListTile(
              leading: const Icon(OctIcons.book,
                  color: Colors.black), // Set icon color to black
              title: const Text('All Training Schemes',
                  style: TextStyle(
                      color: Colors.black)), // Set text color to black
              onTap: () {
                Get.to(() => CourseListPage());
              },
            ),
            ListTile(
              leading: const Icon(OctIcons.light_bulb,
                  color: Colors.black), // Set icon color to black
              title: const Text('All Intern',
                  style: TextStyle(
                      color: Colors.black)), // Set text color to black
              onTap: () {
                Get.to(() => FreelancingPage());
              },
            ),
            ListTile(
              leading: const Icon(OctIcons.diff_ignored,
                  color: Colors.black), // Set icon color to black
              title: const Text('Enrolled',
                  style: TextStyle(
                      color: Colors.black)), // Set text color to black
              onTap: () {
                Get.to(() => const EnrolledCoursesScreen());
              },
            ),
            ListTile(
              leading: const Icon(OctIcons.telescope,
                  color: Colors.black), // Set icon color to black
              title: const Text('Exam',
                  style: TextStyle(
                      color: Colors.black)), // Set text color to black
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExamHome()),
                );
              },
            ),
            ListTile(
              leading: const Icon(OctIcons.info,
                  color: Colors.black), // Set icon color to black
              title: const Text('About',
                  style: TextStyle(
                      color: Colors.black)), // Set text color to black
              onTap: () {
                Get.to(() => AboutPage());
              },
            ),
            ListTile(
              leading: const Icon(OctIcons.sign_out,
                  color: Colors.black), // Set icon color to black
              title: const Text('Sign Out',
                  style: TextStyle(
                      color: Colors.black)), // Set text color to black
              onTap: () {
                // Navigate to LoginPage
                AuthController().signOutUsers();
                Get.off(() => LoginPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
