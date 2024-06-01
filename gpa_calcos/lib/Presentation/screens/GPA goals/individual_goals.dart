import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class IndividaulGoals extends StatefulWidget {
  const IndividaulGoals({super.key});

  @override
  State<IndividaulGoals> createState() => _IndividaulGoalsState();
}

class _IndividaulGoalsState extends State<IndividaulGoals> {
  List<String> grades = ['A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'F'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.color4,
      body: Padding(
        padding: EdgeInsets.all(10.r),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.h),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _rowTextIcon(
                    icon: Icons.notification_important_rounded,
                    text: 'Normal',
                  ),
                  _rowTextIcon(
                    icon: Icons.add,
                    text: 'Add',
                  ),
                  _rowTextIcon(
                    icon: Icons.refresh,
                    text: 'Reset',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.h),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _columnText(
                    text: 'Semester',
                    style: _semester1Style,
                    gpa: '3.5',
                    grade: 'B+',
                  ),
                  _columnText(
                    text: 'Cumulative',
                    style: _semester2Style,
                    gpa: '3.5',
                    grade: 'B+',
                  ),
                  SizedBox(
                    height: 100.h,
                    child: CircularPercentIndicator(
                      radius: 35.h,
                      lineWidth: 3.h,
                      percent: 0.8,
                      progressColor: MainColors.color1,
                      center: SizedBox(
                        height: 70.h,
                        child: CircularPercentIndicator(
                          radius: 24.h,
                          lineWidth: 3.h,
                          percent: 0.8,
                          progressColor: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(15.r),
                        height: 150.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.h),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Course Name',
                                  style: TextStyle(
                                    color: MainColors.color2,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_back_ios_new,
                                  color: MainColors.color2,
                                  size: 18.sp,
                                ),
                              ],
                            ),
                            const Divider(),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: grades.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        grades[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15.sp,
                                          color: MainColors.color1,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 28.w,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _columnTextIcon(
                                  text: 'Rename',
                                  icon: Icons.edit,
                                ),
                                _columnTextIcon(
                                  text: 'Delete',
                                  icon: Icons.delete,
                                ),
                                _columnTextIcon(
                                  text: 'Reset',
                                  icon: Icons.refresh,
                                ),
                              ],
                            )
                          ],
                        )),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }

  Column _columnTextIcon({required String text, required IconData icon}) {
    return Column(
      children: [
        Icon(
          icon,
          size: 18.r,
          color: MainColors.color2,
        ),
        Text(
          text,
          style: TextStyle(
            color: MainColors.color2,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }

  final TextStyle _semester1Style = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
    color: MainColors.color1,
  );
  final TextStyle _semester2Style = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
    color: Colors.red,
  );
  Column _columnText(
      {required String gpa,
      required String grade,
      required TextStyle style,
      required String text}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text, style: style),
        Text(gpa, style: style),
        Text(grade,
            style: style.copyWith(
              fontSize: 20.sp,
            )),
      ],
    );
  }

  Row _rowTextIcon({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(
          icon,
          color: MainColors.color2,
          size: 18.r,
        ),
        Text(
          text,
          style: TextStyle(
            color: MainColors.color2,
            fontWeight: FontWeight.w400,
            fontSize: 17.sp,
          ),
        ),
      ],
    );
  }
}
