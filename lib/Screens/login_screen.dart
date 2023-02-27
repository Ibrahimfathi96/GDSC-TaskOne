import 'package:flutter/material.dart';
import 'package:task_one/CustomWidgets/clipperWidget.dart';
import 'package:task_one/CustomWidgets/text_field_widget.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool _isObscured;

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
                obsecuredText: false,
                inputFieldType: TextInputType.emailAddress,
                hint: 'Enter Your Email',
                textLabel: 'Email',
                iconPrefix: Icons.email_outlined,
              ),
              SizedBox(
                height: size.height / 50,
              ),
              TextFieldWidget(
                obsecuredText: _isObscured,
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
                onPressed: () {},
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
                            width: 1, color: Color.fromARGB(255, 11, 76, 216)),
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);
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
    );
  }
}
