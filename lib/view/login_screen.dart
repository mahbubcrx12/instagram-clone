import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
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
                  hinText: "Enter your email",
                  isPass: true ,
              ),
              SizedBox(height: 24,),
              GestureDetector(
                onTap: (){},
                child: Container(
                  child: const Text("Log In"),
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
                    onTap: (){},
                    child: Container(
                      child: const Text("Sign Up",style: TextStyle(
                        fontWeight: FontWeight.bold
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
