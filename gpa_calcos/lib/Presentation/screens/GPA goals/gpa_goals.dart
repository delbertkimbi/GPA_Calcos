import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/custom_plan.dart';

@RoutePage()
class GpaGoals extends StatefulWidget {
  const GpaGoals({super.key});

  @override
  State<GpaGoals> createState() => _GpaGoalsState();
}

class _GpaGoalsState extends State<GpaGoals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: MainColors.color4,
            )),
        centerTitle: true,
        backgroundColor: MainColors.color2,
        elevation: 0,
        title: Text(
          "GPA Goals",
          style: TextStyle(
              color: MainColors.color4,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: const OptionBox(
              optiontext: 'Group Goals',
              optionICon: Icons.group,
              iconColor: Colors.yellow,
              index: '1',
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
            child: const OptionBox(
              optiontext: 'Individual Goals',
              optionICon: Icons.group,
              iconColor: Colors.yellow,
              index: '2',
            ),
          ),
        ],
      ),
    );
  }
}
