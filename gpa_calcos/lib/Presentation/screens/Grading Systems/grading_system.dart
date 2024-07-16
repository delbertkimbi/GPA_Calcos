import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Presentation/Custom/Widgets/push_pop.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.gr.dart';
import 'package:gpa_calcos/Presentation/screens/coming_soon.dart';

@RoutePage()
class GradingSystem extends StatefulWidget {
  const GradingSystem({super.key});

  @override
  State<GradingSystem> createState() => _GradingSystemState();
}

class _GradingSystemState extends State<GradingSystem> {
  List<String> grades = ["A", "B+", "B", "C+", "C", "D+", "D", "F"];
  List<String> scoreRange = [
    "80-100",
    "70-79",
    "60-69",
    "55-59",
    "50-54",
    "45-49",
    "40-44",
    "0-39"
  ];
  List<double> gradePoints = [4, 3.5, 3, 2.5, 2, 1.5, 1, 0];

  @override
  Widget build(BuildContext context) {
    TextStyle tableText1 = TextStyle(
      color: MainColors.color4,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    );
    TextStyle tableText2 = TextStyle(
      color: MainColors.color1,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
    return Scaffold(
      backgroundColor: MainColors.color4,
      appBar: AppBar(
        leading: const PushOrPop(
          screenName: HomePage(),
        ),
        backgroundColor: MainColors.color2,
        title: Text(
          'Grading System',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: MainColors.color4,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5.r),
          margin: EdgeInsets.all(10.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.r,
              ),
              Table(
                border: TableBorder.all(
                  color: MainColors.color2,
                ),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: MainColors.color2,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.r),
                          child: Text("Score/100", style: tableText1),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.r),
                          child: Text(
                            "Grade",
                            textAlign: TextAlign.center,
                            style: tableText1,
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.r),
                          child: Text(
                            "Point/4",
                            textAlign: TextAlign.center,
                            style: tableText1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ...List.generate(8, (index) {
                    return TableRow(
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.all(8.r),
                            child: Text(
                              scoreRange[index],
                              style: tableText2,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              grades[index],
                              style: tableText2,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.all(8.r),
                            child: Text(
                              "${gradePoints[index]}",
                              style: tableText2,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "This grading system is based on  University of Buea Cameroon approach to grading students. If it does not suit your school, Click on the button below to view other grading systems.",
                style: tableText2,
              ),
              SizedBox(
                height: 10.h,
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CustomizedPage(
                    title: ' Other Systems',
                  ),
                )),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: MainColors.color2,
                ),
                child: Text(
                  "Other systems",
                  style: TextStyle(
                    color: MainColors.color4,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
