import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_input_field.dart';
 class SignUp extends StatefulWidget {
   const SignUp({Key? key}) : super(key: key);

   @override
   State<SignUp> createState() => _SignUpState();
 }

 class _SignUpState extends State<SignUp> {
   final TextEditingController _emailController =TextEditingController();
   final TextEditingController _passwordController =TextEditingController();
   final TextEditingController _bioController =TextEditingController();
   final TextEditingController _userNameController =TextEditingController();

   @override
   void dispose() {
     // TODO: implement dispose
     super.dispose();
     _passwordController.dispose();
     _emailController.dispose();
     _bioController.dispose();
     _userNameController.dispose();
   }

   @override
   Widget build(BuildContext context) {
     return SafeArea(
       child: Scaffold(
         resizeToAvoidBottomInset: false,
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
                 const SizedBox(height: 32,),
                 // accepting image
                 Stack(
                   children: [
                     CircleAvatar(
                       radius: 100,
                       backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRooEnD32-UtBw55GBfDTxxUZApMhWWnRaoLw&usqp=CAU"),
                     ),
                     Positioned(
                         bottom: 10,
                         left: 135,
                         child: IconButton(onPressed: (){},
                         icon: Icon(Icons.add_a_photo,size: 40,color: Colors.blue,)
                     ))
                   ],
                 ),
                 const SizedBox(height: 32,),
                 //text field input for username
                 TextFieldInput(
                     textInputType: TextInputType.text,
                     textEditingController: _userNameController,
                     hinText: "Enter your username"
                 ),
                 SizedBox(height: 24,),
                 //text field input for email
                 TextFieldInput(
                     textInputType: TextInputType.emailAddress,
                     textEditingController: _emailController,
                     hinText: "Enter your email"
                 ),
                 SizedBox(height: 24,),
                 //text field input for password
                 TextFieldInput(
                   textInputType: TextInputType.text,
                   textEditingController: _passwordController,
                   hinText: "Enter your password",
                   isPass: true ,
                 ),
                 SizedBox(height: 24,),
                 //text field input for bio
                 TextFieldInput(
                     textInputType: TextInputType.text,
                     textEditingController: _bioController,
                     hinText: "Enter your bio"
                 ),
                 SizedBox(height: 24,),
                 GestureDetector(
                   onTap: ()async{
                    String res = await AuthMethods().signUpUser(
                       email: _emailController.text,
                       password: _passwordController.text,
                       username: _userNameController.text,
                       bio: _bioController.text,
                     );
                   },
                   child: Container(
                       child: const Text("Sign Up"),
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
                       child: const Text("Already signed up?"),
                       padding: const EdgeInsets.symmetric(vertical: 8),
                     ),
                     GestureDetector(
                       onTap: (){},
                       child: Container(
                         child: const Text("Login",style: TextStyle(
                             fontWeight: FontWeight.bold,
                           color: Colors.blue
                         ),),
                         padding: const EdgeInsets.symmetric(vertical: 8),
                       ),
                     ),

                   ],),

                 SizedBox(height: 15,)

               ],),
           )
       ),
     );
   }
 }
