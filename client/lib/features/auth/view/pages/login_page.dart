import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/auth/repositories/auth_remote_repository.dart';
import 'package:client/features/auth/view/pages/signup_page.dart';
import 'package:client/features/auth/view/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import '../widgets/auth_gradient_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose(){
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
                const Text('Sign in.', style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 40),
                Column(
                  spacing: 25,
                  children: [
                    CustomField(hintText: 'Email', controller: emailController,),
                    CustomField(hintText: 'Password', controller: passwordController, isObscuredText: true,),
                    AuthGradientButton(buttonText: 'Sign in', onTap: () async {
                      final res= await AuthRemoteRepository().login(
                          email: emailController.text,
                          password: passwordController.text
                      );

                      final val = switch(res) {
                        Left(value: final l) => l,
                        Right(value: final r) => r,
                      };
                      print(val);
                    }
                    ,)
                  ],
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage(),
                    ),
                    );
                  },
                  child: RichText(text: TextSpan(
                      text: 'Don\'t have an account?  ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: const [
                        TextSpan(text: 'Sign up', style: TextStyle(
                          color: Palette.gradient2,
                          fontWeight: FontWeight.bold,
                  
                        ),
                        )
                      ]
                  )),
                )
              ],
            ),
          ),
        )
    );
  }
}
