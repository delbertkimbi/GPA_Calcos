// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:flutter/material.dart' as _i22;
import 'package:gpa_calcos/home.dart' as _i7;
import 'package:gpa_calcos/Presentation/screens/auth/login.dart' as _i12;
import 'package:gpa_calcos/Presentation/screens/auth/signup.dart' as _i18;
import 'package:gpa_calcos/Presentation/screens/GPA%20Calculations/get_cgpa_info.dart'
    as _i1;
import 'package:gpa_calcos/Presentation/screens/GPA%20Calculations/get_gpa_info.dart'
    as _i3;
import 'package:gpa_calcos/Presentation/screens/GPA%20Calculations/gpa_calculations_landing.dart'
    as _i4;
import 'package:gpa_calcos/Presentation/screens/GPA%20Calculations/gpa_results.dart'
    as _i16;
import 'package:gpa_calcos/Presentation/screens/GPA%20goals/gpa_goals.dart'
    as _i5;
import 'package:gpa_calcos/Presentation/screens/Grading%20Systems/grading_system.dart'
    as _i6;
import 'package:gpa_calcos/Presentation/screens/noitfications.dart' as _i14;
import 'package:gpa_calcos/Presentation/screens/splash/icon_landing.dart'
    as _i8;
import 'package:gpa_calcos/Presentation/screens/splash/landing.dart' as _i9;
import 'package:gpa_calcos/Presentation/screens/Study%20planner/daily.dart'
    as _i2;
import 'package:gpa_calcos/Presentation/screens/Study%20planner/landing.dart'
    as _i19;
import 'package:gpa_calcos/Presentation/screens/Study%20planner/monthly.dart'
    as _i13;
import 'package:gpa_calcos/Presentation/screens/Study%20planner/semester.dart'
    as _i17;
import 'package:gpa_calcos/Presentation/screens/Study%20planner/study_planner.dart'
    as _i15;
import 'package:gpa_calcos/Presentation/screens/Study%20planner/weekly.dart'
    as _i20;
import 'package:gpa_calcos/Presentation/screens/Study%20Resources/learning_resources.dart'
    as _i11;
import 'package:gpa_calcos/Presentation/screens/Study%20Resources/resource_landing.dart'
    as _i10;

abstract class $AppRouter extends _i21.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    CgpaInfo.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CgpaInfo(),
      );
    },
    DailySchedules.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DailySchedules(),
      );
    },
    GetSubjectInfo.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.GetSubjectInfo(),
      );
    },
    GpaCalculationsLanding.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.GpaCalculationsLanding(),
      );
    },
    GpaGoals.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.GpaGoals(),
      );
    },
    GradingSystem.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.GradingSystem(),
      );
    },
    HomePage.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomePage(),
      );
    },
    IconLandingPage.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.IconLandingPage(),
      );
    },
    LandingPage.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LandingPage(),
      );
    },
    LearningRourcesLanding.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.LearningRourcesLanding(),
      );
    },
    Learningpage.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.Learningpage(),
      );
    },
    LogIn.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.LogIn(),
      );
    },
    MonthlySchedules.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.MonthlySchedules(),
      );
    },
    NotifactionsPage.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.NotifactionsPage(),
      );
    },
    PlannerLandingPage.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PlannerLandingPage(),
      );
    },
    ResultPage.name: (routeData) {
      final args = routeData.argsAs<ResultPageArgs>();
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.ResultPage(
          key: args.key,
          ccv: args.ccv,
          cwgp: args.cwgp,
          gpa: args.gpa,
        ),
      );
    },
    SemesterSchedules.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.SemesterSchedules(),
      );
    },
    SignUp.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.SignUp(),
      );
    },
    StudyPlanLandingPage.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.StudyPlanLandingPage(),
      );
    },
    WeeklySchedules.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.WeeklySchedules(),
      );
    },
  };
}

/// generated route for
/// [_i1.CgpaInfo]
class CgpaInfo extends _i21.PageRouteInfo<void> {
  const CgpaInfo({List<_i21.PageRouteInfo>? children})
      : super(
          CgpaInfo.name,
          initialChildren: children,
        );

  static const String name = 'CgpaInfo';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DailySchedules]
class DailySchedules extends _i21.PageRouteInfo<void> {
  const DailySchedules({List<_i21.PageRouteInfo>? children})
      : super(
          DailySchedules.name,
          initialChildren: children,
        );

  static const String name = 'DailySchedules';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i3.GetSubjectInfo]
class GetSubjectInfo extends _i21.PageRouteInfo<void> {
  const GetSubjectInfo({List<_i21.PageRouteInfo>? children})
      : super(
          GetSubjectInfo.name,
          initialChildren: children,
        );

  static const String name = 'GetSubjectInfo';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i4.GpaCalculationsLanding]
class GpaCalculationsLanding extends _i21.PageRouteInfo<void> {
  const GpaCalculationsLanding({List<_i21.PageRouteInfo>? children})
      : super(
          GpaCalculationsLanding.name,
          initialChildren: children,
        );

  static const String name = 'GpaCalculationsLanding';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i5.GpaGoals]
class GpaGoals extends _i21.PageRouteInfo<void> {
  const GpaGoals({List<_i21.PageRouteInfo>? children})
      : super(
          GpaGoals.name,
          initialChildren: children,
        );

  static const String name = 'GpaGoals';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i6.GradingSystem]
class GradingSystem extends _i21.PageRouteInfo<void> {
  const GradingSystem({List<_i21.PageRouteInfo>? children})
      : super(
          GradingSystem.name,
          initialChildren: children,
        );

  static const String name = 'GradingSystem';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomePage]
class HomePage extends _i21.PageRouteInfo<void> {
  const HomePage({List<_i21.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i8.IconLandingPage]
class IconLandingPage extends _i21.PageRouteInfo<void> {
  const IconLandingPage({List<_i21.PageRouteInfo>? children})
      : super(
          IconLandingPage.name,
          initialChildren: children,
        );

  static const String name = 'IconLandingPage';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LandingPage]
class LandingPage extends _i21.PageRouteInfo<void> {
  const LandingPage({List<_i21.PageRouteInfo>? children})
      : super(
          LandingPage.name,
          initialChildren: children,
        );

  static const String name = 'LandingPage';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i10.LearningRourcesLanding]
class LearningRourcesLanding extends _i21.PageRouteInfo<void> {
  const LearningRourcesLanding({List<_i21.PageRouteInfo>? children})
      : super(
          LearningRourcesLanding.name,
          initialChildren: children,
        );

  static const String name = 'LearningRourcesLanding';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i11.Learningpage]
class Learningpage extends _i21.PageRouteInfo<void> {
  const Learningpage({List<_i21.PageRouteInfo>? children})
      : super(
          Learningpage.name,
          initialChildren: children,
        );

  static const String name = 'Learningpage';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i12.LogIn]
class LogIn extends _i21.PageRouteInfo<void> {
  const LogIn({List<_i21.PageRouteInfo>? children})
      : super(
          LogIn.name,
          initialChildren: children,
        );

  static const String name = 'LogIn';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i13.MonthlySchedules]
class MonthlySchedules extends _i21.PageRouteInfo<void> {
  const MonthlySchedules({List<_i21.PageRouteInfo>? children})
      : super(
          MonthlySchedules.name,
          initialChildren: children,
        );

  static const String name = 'MonthlySchedules';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i14.NotifactionsPage]
class NotifactionsPage extends _i21.PageRouteInfo<void> {
  const NotifactionsPage({List<_i21.PageRouteInfo>? children})
      : super(
          NotifactionsPage.name,
          initialChildren: children,
        );

  static const String name = 'NotifactionsPage';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i15.PlannerLandingPage]
class PlannerLandingPage extends _i21.PageRouteInfo<void> {
  const PlannerLandingPage({List<_i21.PageRouteInfo>? children})
      : super(
          PlannerLandingPage.name,
          initialChildren: children,
        );

  static const String name = 'PlannerLandingPage';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i16.ResultPage]
class ResultPage extends _i21.PageRouteInfo<ResultPageArgs> {
  ResultPage({
    _i22.Key? key,
    required double ccv,
    required double cwgp,
    required double gpa,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          ResultPage.name,
          args: ResultPageArgs(
            key: key,
            ccv: ccv,
            cwgp: cwgp,
            gpa: gpa,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultPage';

  static const _i21.PageInfo<ResultPageArgs> page =
      _i21.PageInfo<ResultPageArgs>(name);
}

class ResultPageArgs {
  const ResultPageArgs({
    this.key,
    required this.ccv,
    required this.cwgp,
    required this.gpa,
  });

  final _i22.Key? key;

  final double ccv;

  final double cwgp;

  final double gpa;

  @override
  String toString() {
    return 'ResultPageArgs{key: $key, ccv: $ccv, cwgp: $cwgp, gpa: $gpa}';
  }
}

/// generated route for
/// [_i17.SemesterSchedules]
class SemesterSchedules extends _i21.PageRouteInfo<void> {
  const SemesterSchedules({List<_i21.PageRouteInfo>? children})
      : super(
          SemesterSchedules.name,
          initialChildren: children,
        );

  static const String name = 'SemesterSchedules';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i18.SignUp]
class SignUp extends _i21.PageRouteInfo<void> {
  const SignUp({List<_i21.PageRouteInfo>? children})
      : super(
          SignUp.name,
          initialChildren: children,
        );

  static const String name = 'SignUp';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i19.StudyPlanLandingPage]
class StudyPlanLandingPage extends _i21.PageRouteInfo<void> {
  const StudyPlanLandingPage({List<_i21.PageRouteInfo>? children})
      : super(
          StudyPlanLandingPage.name,
          initialChildren: children,
        );

  static const String name = 'StudyPlanLandingPage';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i20.WeeklySchedules]
class WeeklySchedules extends _i21.PageRouteInfo<void> {
  const WeeklySchedules({List<_i21.PageRouteInfo>? children})
      : super(
          WeeklySchedules.name,
          initialChildren: children,
        );

  static const String name = 'WeeklySchedules';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}
