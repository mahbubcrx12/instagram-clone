import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../utils/global_variable.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout({Key? key,required this.mobileScreenLayout,required this.webScreenLayout}) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {

  @override
  void initState() {
    super.initState();
    addData();
  }
  addData()async{
    UserProvider _userProvider = Provider.of(context,listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder:(context,constraints){
          if(constraints.maxWidth > webScreenSize){
            return widget.webScreenLayout;
          }
          return widget.mobileScreenLayout;
        }
    );
  }
}
