import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa_calcos/Bussiness/calculation/GetUserInfoCubit/subject_info_cubit_cubit.dart';
import 'package:gpa_calcos/Bussiness/calculation/gpa_cubit/gpa_cubit.dart';
import 'package:gpa_calcos/Bussiness/user_cubit/user_cubit.dart';
import 'package:gpa_calcos/Presentation/Custom/files/key.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.dart';
import 'package:gpa_calcos/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Avoid screen from rotating when devide is slanted
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Gemini.init(apiKey: GEMINI_API_KEY);
  runApp(
  MultiBlocProvider(providers: [
    BlocProvider(create: (context)=>SubjectInfoCubit()),
    BlocProvider<UserCubit>(create: (context) => UserCubit()),
    BlocProvider(create: (context) => GpaCubit()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: appRouter.config(),
          debugShowCheckedModeBanner: false,
          title: 'GPA Guide',
          theme: ThemeData(
            textTheme: GoogleFonts.baloo2TextTheme(textTheme).copyWith(
              bodyMedium: GoogleFonts.baloo2(textStyle: textTheme.bodyMedium),
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xffDDDDFF),
            ),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
