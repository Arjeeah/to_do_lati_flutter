import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_lati/providers/dark_mode_provider.dart';
import 'package:to_do_lati/providers/localization_provider.dart';
import 'package:to_do_lati/providers/task_provider.dart';
import 'package:to_do_lati/screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskProvider>(
          create: (context) => TaskProvider()..getTask(),
        ),
        ChangeNotifierProvider(
            create: (context) => DarkModeProvider()..getMode()),
        ChangeNotifierProvider(
            create: (context) => LocalizationProvider()..getLang())
      ],
      child:
          Consumer<LocalizationProvider>(builder: (context, langConsumer, _) {
        return Consumer<DarkModeProvider>(builder: (context, darkMode, _) {
          return MaterialApp(
            locale: Locale(langConsumer.lang),
            localizationsDelegates: const [
              AppLocalizations.delegate, // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English
              Locale('es'), // Spanish
              Locale('ar'),
            ],
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor:
                      darkMode.isDark ? Colors.white : Colors.black54),
              drawerTheme: DrawerThemeData(
                  backgroundColor:
                      darkMode.isDark ? Colors.black87 : Colors.white),
              appBarTheme: AppBarTheme(
                  centerTitle: true,
                  backgroundColor:
                      darkMode.isDark ? Colors.blue : Colors.lightBlue),
              tabBarTheme: TabBarTheme(
                  labelColor: darkMode.isDark ? Colors.white : Colors.blueGrey),
              scaffoldBackgroundColor:
                  darkMode.isDark ? Colors.black54 : Colors.white,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HomeScreen(),
          );
        });
      }),
    );
  }
}
