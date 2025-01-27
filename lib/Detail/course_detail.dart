import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_cource_app/Detail/course_content.dart';
import 'package:online_cource_app/constants.dart';

class CoursesDetail extends StatefulWidget {
  final String imgDetail;
  final String title;
  final String price;
  const CoursesDetail({
    super.key,
    required this.imgDetail,
    required this.title,
    required this.price,
  });

  @override
  State<CoursesDetail> createState() => _CoursesDetailState();
}

class _CoursesDetailState extends State<CoursesDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Hero(
          tag: 'img1',
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned.fill(
                      bottom: 350,
                      child: Container(
                        height: size.height * 0.45,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.imgDetail),
                              fit: BoxFit.fill),
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert),
                            )
                          ],
                        ),
                      ),
                      // for best seller
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ],
                  ),
                  CourseContent(size: size)
                ],
              )
            ],
          ),
        ),
      ),
      bottomSheet: bottomParts(),
    );
  }

  Container bottomParts() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 5,
              blurRadius: 10,
              color: Colors.black.withOpacity(0.05),
            ),
          ]),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 55,
              width: 70,
              decoration: BoxDecoration(
                color: redLight,
                borderRadius: BorderRadius.circular(30),
              ),
              child: SvgPicture.asset("images/cart_icon.svg"),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 65,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
                    "Enroll Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
