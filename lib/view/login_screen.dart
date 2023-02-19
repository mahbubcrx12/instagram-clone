import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/view/sign_up.dart';
import 'package:instagram_clone/widgets/text_input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
  bool _isLoading =false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }

  void loginUser()async{
    setState(() {
      _isLoading ==true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if(res == 'Success'){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout())));
    }else{
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void navigateToSignUp(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(),flex: 2,),
            SvgPicture.asset("assets/ic_instagram.svg",
            color: primaryColor,
              height:64,
            ),
             const SizedBox(height: 64,),
              TextFieldInput(
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _emailController,
                  hinText: "Enter your email"
              ),
              SizedBox(height: 24,),
              TextFieldInput(
                  textInputType: TextInputType.text,
                  textEditingController: _passwordController,
                  hinText: "Password",
                  isPass: true ,
              ),
              SizedBox(height: 24,),
              GestureDetector(
                onTap: loginUser,
                child: Container(
                  child:_isLoading ? Center(child: CircularProgressIndicator(
                    color: Colors.red,
                  ),) : const Text("Log In"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding:const EdgeInsets.symmetric(vertical: 12),
                  decoration: ShapeDecoration(
                    color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4)
                        )
                      )
                  )
                ),
              ),
             const SizedBox(height: 12,),
              Flexible(child: Container(),flex: 2,),

              //transitioning to signing up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Don't have an account?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: navigateToSignUp,
                    child: Container(
                      child: const Text("Sign Up",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                      ),),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  )
              ],)
              


          ],),
        )
      ),
    );
  }
}
