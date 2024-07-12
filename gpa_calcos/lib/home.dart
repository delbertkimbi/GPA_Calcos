import 'package:auto_route/auto_route.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/Widgets/drawer.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.gr.dart';
import 'package:gpa_calcos/Presentation/screens/chat.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoggedIn = false; // Track user's sign-in state
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _isLoggedIn = user != null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffF1EFFA),
            Color(0xffF1EFFA),
            Color(0xffF1EFFA),
            Color(0xff9191F5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        // color: Colors.white,
      ),
      child: Scaffold(
        key: _scaffoldKey, // Assign GlobalKey
        drawer: const CustomDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ChatAI(),
            ));
          },
          child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChatAI(),
                ));
              },
              icon: const Icon(Icons.chat)),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () =>
                  AutoRouter.of(context).push(const NotifactionsPage()),
              icon: Icon(
                Icons.notification_add,
                color: MainColors.color1,
              ),
            ),
            _isLoggedIn
                ? CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 14.r,
                    child: Text(
                      'D',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: MainColors.color1,
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () => AutoRouter.of(context).push(const LogIn()),
                    child: Container(
                      width: 55.r,
                      height: 27.r,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(2.r),
                      decoration: BoxDecoration(
                          color: MainColors.color1,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Text(
                        'LogIn',
                        style: TextStyle(
                          color: MainColors.color4,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              width: 15.h,
            ),
          ],
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: 27.r,
            ),
            color: MainColors.color1,
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer(); // Use GlobalKey
            },
          ),
          backgroundColor: MainColors.color4,
          elevation: 5,
          centerTitle: true,
          title: Text(
            'GPA Guide',
            style: TextStyle(
              color: MainColors.color1,
              fontWeight: FontWeight.bold,
              fontSize: 25.sp,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.all(8.r),
                margin: EdgeInsets.symmetric(horizontal: 20.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customBox(
                          color: Colors.red,
                          icon: Icons.drive_file_rename_outline_rounded,
                          text: 'GPA \nGoals',
                          page: const GpaGoals(),
                        ),
                        SizedBox(
                          width: 30.h,
                        ),
                        customBox(
                          color: Colors.white,
                          icon: Icons.calculate_rounded,
                          text: 'GPA \nCalcos',
                          page: const GpaCalculationsLanding(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customBox(
                          color: MainColors.color1,
                          icon: Icons.menu_book_sharp,
                          text: 'Study \nplanner',
                          page: const PlannerLandingPage(),
                        ),
                        SizedBox(
                          width: 30.h,
                        ),
                        customBox(
                          color: Colors.yellow,
                          icon: Icons.grade_rounded,
                          text: 'Grading \nSystem',
                          page: const GradingSystem(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 10.h,
              // ),
              SizedBox(
                height: 350.r,
                width: 400.r,
                child: CarouselSlider(
                  items: [
                    // Define each image item here
                    Image.asset(
                      'assets/bob2.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/bob1.png',
                      fit: BoxFit.cover,
                    ),

                    Image.asset(
                      'assets/bob3.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/bob4.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/bob5.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/bob6.png',
                      fit: BoxFit.cover,
                    ),

                    // Add more image assets as needed
                  ],
                  options: CarouselOptions(
                    height: 330.r,
                    aspectRatio: 16 / 9, // Adjust aspect ratio if needed
                    viewportFraction:
                        1.5, // Adjust visible portion of each slide
                    enableInfiniteScroll: true, // Enable looping through images
                    autoPlay: true, // Set to true for automatic sliding
                    autoPlayInterval: const Duration(seconds: 5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector customBox(
      {required String text,
      required final page,
      required IconData icon,
      required Color color}) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(page);
      },
      child: Container(
        height: 130.h,
        width: 130.h,
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: const Color(0xff9191F5),
          // color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              // color: Colors.black.withOpacity(0.3.r),
              color: const Color(0xff9191F5),
              offset: const Offset(4.0, 4.0),
              blurRadius: 25.0.r,
              spreadRadius: 1.0.r,
            ),
            BoxShadow(
              // color: Colors.black.withOpacity(0.3.r),
              color: MainColors.color4,
              offset: const Offset(-4.0, -4.0),
              blurRadius: 5.0.r,
              spreadRadius: 1.0.r,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30.r,
              color: color,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
