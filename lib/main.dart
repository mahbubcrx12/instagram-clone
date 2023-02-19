import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/provider/user_provider.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/view/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> UserProvider(),),
      ],
      child: MaterialApp(
          title: 'Instagram Clone',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: mobileBackgroundColor,

          ),

        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context,snapshoot){
              if(snapshoot.connectionState == ConnectionState.active){
                if(snapshoot.hasData){
                  return const ResponsiveLayout(
                      mobileScreenLayout: MobileScreenLayout(),
                      webScreenLayout: WebScreenLayout()
                  );
                }else if(snapshoot.hasError){
                  return Center(
                    child: Text("${snapshoot.error}"),
                  );
                }
              }
              if(snapshoot.connectionState == ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              }
              return const LoginPage();
            }
        ),
      ),
    );
  }
}
