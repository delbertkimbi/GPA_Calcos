import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';

class PushOrPop extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final screenName;
  const PushOrPop({
    super.key,
    required this.screenName,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          AutoRouter.of(context).push(screenName as PageRouteInfo);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: MainColors.color4,
        ));
  }
}
