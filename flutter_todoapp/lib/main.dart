// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todoapp/presentation/bloc/switch_bloc/bloc/switch_bloc.dart';
import 'package:flutter_todoapp/presentation/bloc/tasks_bloc/bloc/tasks_bloc.dart';
import 'package:flutter_todoapp/presentation/res/app_theme.dart';
import 'package:flutter_todoapp/presentation/res/theme_manger.dart';
import 'package:flutter_todoapp/presentation/screen/bottom_bar.dart';
import 'package:flutter_todoapp/presentation/screen/homepage.dart';
import 'package:flutter_todoapp/presentation/screen/recycle_bin.dart';
import 'package:flutter_todoapp/presentation/screen/task_screen.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage=await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory()
  );
  runApp(const MyApp());

}
  ThemeManger themeManger=ThemeManger();
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    themeManger.removeListener( themeListener);
    super.dispose();
  }
  @override
  void initState() {
themeManger.addListener( themeListener)    ;
super.initState();
  }
  themeListener(){
    if(mounted){
      setState(() {
        
      });
    }
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeManger.themeMode,
              // theme: state.switchValue?AppThemes.appThemeData[AppTheme.darkTheme]:
              // AppThemes.appThemeData[AppTheme.darkTheme],
              home: Homepage(),
              routes: {
               
               
                'taskscreen': (context) => TaskScreen(),
                'recylebin': (context) => RecyleBin(),
                'bottomnavigationbarr': (context) => BottomNavigationBarr(),
              });
        },
      ),
    );
  }
}
