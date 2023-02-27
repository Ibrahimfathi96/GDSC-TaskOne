import 'package:flutter/material.dart';
import 'package:task_one/CustomWidgets/clipperWidget.dart';
import 'package:task_one/CustomWidgets/text_field_widget.dart';
import 'package:task_one/Screens/animated_list_screen.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late bool _isObscured;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isObscured = true;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ClipPath(
                  clipper: ClipperWidget(),
                  child: Container(
                    color: const Color.fromARGB(255, 11, 76, 216),
                    height: size.height / 3,
                    width: size.width,
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 46,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 8,
                ),
                TextFieldWidget(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter an Email';
                    } else if (emailController.text.contains('@') == false ||
                        emailController.text.contains('.') == false) {
                      return 'Enter a Valid Email';
                    }
                    return null;
                  },
                  isObscured: false,
                  inputFieldType: TextInputType.emailAddress,
                  hint: 'Enter Your Email',
                  textLabel: 'Email',
                  iconPrefix: Icons.email_outlined,
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                TextFieldWidget(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter a Password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 Characters';
                    }
                    return null;
                  },
                  isObscured: _isObscured,
                  inputFieldType: TextInputType.visiblePassword,
                  hint: 'Enter Your Password',
                  textLabel: 'Password',
                  iconPrefix: Icons.email_outlined,
                  iconSuffix: IconButton(
                    color: Colors.indigo,
                    icon: _isObscured
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width / 2.8,
                          vertical: size.height / 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: const Color.fromARGB(255, 11, 76, 216)),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnimatedListScreen(),
                          ));
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: size.height / 60,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width / 3.1,
                          vertical: size.height / 50),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 11, 76, 216)),
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Colors.white),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    }
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        color: Color.fromARGB(255, 11, 76, 216),
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
