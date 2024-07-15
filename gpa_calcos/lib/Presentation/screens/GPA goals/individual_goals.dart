import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calcos/Bussiness/calculation/GetUserInfoCubit/subject_info_cubit_cubit.dart';
import 'package:gpa_calcos/Data/models/subjects.dart';
import 'package:gpa_calcos/Presentation/Custom/files/Toast/showtoast.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/register_button.dart';
import 'package:gpa_calcos/Presentation/Custom/files/textfield.dart';
import 'package:percent_indicator/percent_indicator.dart';

class IndividaulGoals extends StatefulWidget {
  const IndividaulGoals({super.key});

  @override
  State<IndividaulGoals> createState() => _IndividaulGoalsState();
}

class _IndividaulGoalsState extends State<IndividaulGoals> {
  List<String> grades = ['A', 'B', 'B+', 'C+', 'C', 'D+', 'D', 'F'];
  bool viewAll = false;
  int tappedIndex = -1;
  bool isGradeTapped = false;
  TextEditingController subjectNameController = TextEditingController();

  TextEditingController creditValueNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectInfoCubit, List<Subject>>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: MainColors.color2,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'MY Goals',
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: MainColors.color4),
            ),
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: MainColors.color4,
                )),
          ),
          backgroundColor: MainColors.color4,
          body: Padding(
            padding: EdgeInsets.all(10.r),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.r),
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
                      GestureDetector(
                        onTap: () {
                          getSubjectInfoDialog(context);
                        },
                        child: _rowTextIcon(
                          icon: Icons.add,
                          text: 'Add',
                        ),
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
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
                          gpa: BlocProvider.of<SubjectInfoCubit>(context)
                              .calculateGPA()
                              .toString(),
                          grade: BlocProvider.of<SubjectInfoCubit>(context)
                              .totalGpaValueGrade()),
                      _columnText(
                        text: 'Cumulative',
                        style: _semester2Style,
                        gpa: BlocProvider.of<SubjectInfoCubit>(context)
                            .calculateGPA()
                            .toString(),
                        grade: BlocProvider.of<SubjectInfoCubit>(context)
                            .totalGpaValueGrade(),
                      ),
                      SizedBox(
                        height: 100.h,
                        child: CircularPercentIndicator(
                          radius: 35.h,
                          lineWidth: 4.h,
                          percent: BlocProvider.of<SubjectInfoCubit>(context)
                                  .calculateGPA() /
                              4,
                          progressColor: MainColors.color1,
                          center: SizedBox(
                            height: 70.h,
                            child: CircularPercentIndicator(
                              radius: 24.h,
                              lineWidth: 4.h,
                              percent:
                                  BlocProvider.of<SubjectInfoCubit>(context)
                                          .calculateGPA() /
                                      4,
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
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      final subject = state[index];
                      return Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(15.r),
                              height: viewAll ? 100.h : 150.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.h),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        subject.name,
                                        style: TextStyle(
                                          color: MainColors.color2,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      viewAll
                                          ? GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  viewAll = !viewAll;
                                                });
                                              },
                                              child: Icon(
                                                Icons.arrow_back_ios_new,
                                                color: MainColors.color2,
                                                size: 18.sp,
                                              ),
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  viewAll = !viewAll;
                                                });
                                              },
                                              child: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: MainColors.color2,
                                                size: 25.sp,
                                              ),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (subject.grade !=
                                                      grades[index]) {
                                                    isGradeTapped = true;
                                                    tappedIndex = index;
                                                    subject.grade =
                                                        grades[index];
                                                  }
                                                });
                                              },
                                              child: Container(
                                                width: 20.r,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: subject.grade ==
                                                          grades[index]
                                                      ? MainColors.color4
                                                      : Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Text(
                                                  grades[index],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18.sp,
                                                    color: MainColors.color1,
                                                  ),
                                                ),
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
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  viewAll
                                      ? Container()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                updateName(
                                                    context, state, subject);
                                              },
                                              child: _columnTextIcon(
                                                text: 'Rename',
                                                icon: Icons.edit,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                deleteSubject(
                                                    context, state, subject);
                                              },
                                              child: _columnTextIcon(
                                                text: 'Delete',
                                                icon: Icons.delete,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  state[index].grade = ' ';
                                                });
                                              },
                                              child: _columnTextIcon(
                                                text: 'Reset',
                                                icon: Icons.refresh,
                                              ),
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
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> updateName(
      BuildContext context, List<Subject> state, Subject subject) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 150.h,
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextField(
                    onChaged: (value) {},
                    text: 'Subject Name',
                    controller: subjectNameController,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        subject.name = subjectNameController.text;
                      });
                    },
                    child: RegisterButton(
                      textSize: 18.sp,
                      text: 'update',
                      color: MainColors
                          .color1, // Disable button or change color on error
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<dynamic> deleteSubject(
      BuildContext context, List<Subject> state, Subject subject) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            height: 100.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Are you sure?',
                  style: TextStyle(
                    color: MainColors.color1,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Text(
                        'No',
                        style: TextStyle(
                          color: MainColors.color1,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          state.remove(subject);
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> getSubjectInfoDialog(BuildContext context) {
    bool creditValueError = false;
    bool gradeError = false; //
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: MainColors.color2,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 25.h,
              ),
              CustomTextField(
                onChaged: (value) {},
                text: 'Subject Name',
                controller: subjectNameController,
              ),
              SizedBox(
                height: 7.h,
              ),
              CustomTextField(
                onChaged: (value) {
                  try {
                    double.parse(value);
                    creditValueError = false; // Reset error flag on valid input
                  } on FormatException {
                    creditValueError = true;
                    showToast(message: 'Invalid credit value.');
                  }
                },
                text: 'Credit Value',
                controller: creditValueNameController,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SizedBox(
                      width: 90.w,
                      child: RegisterButton(
                        textSize: 18.sp,
                        text: 'close',
                        color: creditValueError || gradeError
                            ? Colors.grey
                            : Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      String subjectName = subjectNameController.text.trim();
                      String creditValueString =
                          creditValueNameController.text.trim();
                      if (subjectName.isEmpty || creditValueString.isEmpty) {
                        showToast(
                            message:
                                'Please fill in all fields (Subject Name,Credit Value).');

                        return; // Exit the tap handler if any field is empty
                      }
                    },
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<SubjectInfoCubit>(context).addSubject(
                            subjectNameController.text,
                            ' ',
                            double.parse(
                                creditValueNameController.text.toString()));
                      },
                      child: SizedBox(
                        width: 90.w,
                        child: RegisterButton(
                          textSize: 18.sp,
                          text: 'Add',
                          color: creditValueError || gradeError
                              ? Colors.grey
                              : MainColors
                                  .color1, // Disable button or change color on error
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
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
              fontSize: 18.sp,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  final TextStyle _semester1Style = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
    color: MainColors.color1,
  );
  final TextStyle _semester2Style = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
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
