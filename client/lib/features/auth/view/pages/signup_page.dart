import 'package:client/core/theme/app_pallete.dart';
import 'package:client/core/widgets/loader.dart';
import 'package:client/features/auth/view/pages/login_page.dart';
import 'package:client/features/auth/view/widgets/custom_field.dart';
import 'package:client/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/auth_gradient_button.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
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
    final isLoading = ref.watch(authViewModelProvider)?.isLoading == true;
    return Scaffold(
      appBar: AppBar(),
      body: isLoading ? const Loader()
      : Padding(
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
                  AuthGradientButton(buttonText: 'Sign up',
                    onTap: () async {
                      String now = DateTime.now().toString();
                      if(formKey.currentState!.validate()){
                        await ref.read(authViewModelProvider.notifier).signUpUser(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              timestamp: now
                          );
                        }
                      },
                  )
                ],
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                  ),
                  );
                },
                child: RichText(text: TextSpan(
                  text: 'Already have an account?  ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: const [
                    TextSpan(text: 'Sign in', style: TextStyle(
                      color: Palette.gradient2,
                      fontWeight: FontWeight.bold,

                    ))
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
