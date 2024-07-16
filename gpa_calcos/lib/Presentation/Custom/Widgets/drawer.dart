import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/list_tile.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.gr.dart';

import 'package:gpa_calcos/Presentation/screens/about.dart';
import 'package:gpa_calcos/Presentation/screens/auth/auth_services.dart';

import 'package:gpa_calcos/Presentation/screens/chat.dart';
import 'package:gpa_calcos/Presentation/screens/coming_soon.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final _auth = AuthService();
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
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: MainColors.color2,
            ),
            accountName: Text(
              'GPA Guide',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            accountEmail: Text(
              'Your semester study plug, with AI.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 5.h,
              backgroundColor: MainColors.color4,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0.r),
                      ),
                      child: Container(
                        height: 300.h,
                        width: 250.w,
                        decoration: BoxDecoration(
                          color: MainColors.color4,
                          borderRadius: BorderRadius.circular(10.r),
                          image: const DecorationImage(
                            image: AssetImage('assets/guide.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 28.h,
                  backgroundColor: MainColors.color4,
                  child: ClipOval(
                    child: Image.asset('assets/try.png'),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: MainColors.color4,
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: CustomListTile(
                      title: "Home",
                      icon: Icon(
                        Icons.home,
                        color: MainColors.color2,
                        size: 30.r,
                      )),
                ),
                GestureDetector(
                  onTap: () => AutoRouter.of(context)
                      .push(const GpaCalculationsLanding()),
                  child: CustomListTile(
                      title: "GPA Calculations",
                      icon: Icon(
                        Icons.calculate,
                        color: MainColors.color2,
                        size: 30.r,
                      )),
                ),
                GestureDetector(
                  onTap: () => AutoRouter.of(context).push(const GpaGoals()),
                  child: CustomListTile(
                      title: "GPA Goals",
                      icon: Icon(
                        Icons.calculate_outlined,
                        color: MainColors.color2,
                        size: 30.r,
                      )),
                ),
                Divider(
                  height: 50.r,
                  color: Colors.black,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const ChatAI())),
                  child: CustomListTile(
                    title: "Chat with Others/AI",
                    icon: Icon(
                      Icons.route,
                      color: MainColors.color2,
                      size: 30.r,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      AutoRouter.of(context).push(const Learningpage()),
                  child: CustomListTile(
                    title: "Study Resources",
                    icon: Icon(
                      Icons.search_rounded,
                      color: MainColors.color2,
                      size: 30.r,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CustomizedPage(
                      title: 'Did you Know?',
                    ),
                  )),
                  child: CustomListTile(
                    title: "Did you Know?",
                    icon: Icon(
                      Icons.help,
                      color: MainColors.color2,
                      size: 30.r,
                    ),
                  ),
                ),
                Divider(
                  height: 50.r,
                  color: Colors.black,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  )),
                  child: CustomListTile(
                    title: "About App",
                    icon: Icon(
                      Icons.adb_rounded,
                      color: MainColors.color2,
                      size: 30.r,
                    ),
                  ),
                ),
                _isLoggedIn
                    ? Row(
                        children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            'SignOut',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: MainColors.color2,
                            ),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          IconButton(
                              onPressed: () async {
                                await _auth.signOut();
                                // ignore: use_build_context_synchronously
                                context.router.replace(const LogIn());
                              },
                              icon: Icon(
                                Icons.logout,
                                color: MainColors.color2,
                                size: 30.r,
                              )),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
