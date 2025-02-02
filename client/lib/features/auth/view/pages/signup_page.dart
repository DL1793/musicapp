import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/auth/view/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import '../widgets/auth_gradient_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose(){
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
    formKey.currentState!.validate();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sign up.', style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 40),
              Column(
                spacing: 25,
                children: [
                  CustomField(hintText: 'Name', controller: nameController),
                  CustomField(hintText: 'Email', controller: emailController,),
                  CustomField(hintText: 'Password', controller: passwordController, isObscuredText: true,),
                  AuthGradientButton(buttonText: 'Sign up', onTap: (){},)
                ],
              ),
              SizedBox(height: 15),
              RichText(text: TextSpan(
                text: 'Already have an account?  ',
                  style: Theme.of(context).textTheme.titleMedium,
                  children: const [
                  TextSpan(text: 'Sign in', style: TextStyle(
                    color: Palette.gradient2,
                    fontWeight: FontWeight.bold,

                  ))
                ]
              ))
            ],
          ),
        ),
      )
    );
  }
}
