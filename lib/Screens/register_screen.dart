import 'package:flutter/material.dart';
import 'package:task_one/CustomWidgets/clipperWidget.dart';
import 'package:task_one/CustomWidgets/text_field_widget.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register Screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late bool _isObscured1;
  late bool _isObscured2;

  @override
  void initState() {
    super.initState();
    _isObscured1 = true;
    _isObscured2 = true;
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
                  width: size.width,
                  height: size.height / 3.5,
                  child: const Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 46,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      TextFieldWidget(
                        obsecuredText: false,
                        textLabel: 'Full Name',
                        hint: 'Enter Your Name',
                        iconPrefix: Icons.person,
                        inputFieldType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        obsecuredText: false,
                        textLabel: 'Phone Number',
                        hint: 'Enter Your Phone Number',
                        iconPrefix: Icons.phone,
                        inputFieldType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          obsecuredText: false,
                          inputFieldType: TextInputType.emailAddress,
                          textLabel: 'Email',
                          hint: 'Enter Your Email',
                          iconPrefix: Icons.email),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        obsecuredText: _isObscured1,
                        iconSuffix: IconButton(
                          color: Colors.indigo,
                          icon: _isObscured1
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscured1 = !_isObscured1;
                            });
                          },
                        ),
                        inputFieldType: TextInputType.visiblePassword,
                        textLabel: 'Password',
                        hint: 'Enter Your Password',
                        iconPrefix: Icons.lock,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        obsecuredText: _isObscured2,
                        iconSuffix: IconButton(
                          color: Colors.indigo,
                          icon: _isObscured2
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscured2 = !_isObscured2;
                            });
                          },
                        ),
                        inputFieldType: TextInputType.visiblePassword,
                        textLabel: 'Confirm Password',
                        hint: 'Enter The same Password',
                        iconPrefix: Icons.lock,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width / 3,
                                vertical: size.height / 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor:
                                const Color.fromARGB(255, 11, 76, 216)),
                        onPressed: () {},
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 70,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width / 2.8,
                                vertical: size.height / 60),
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 11, 76, 216)),
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: Colors.white),
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: Color.fromARGB(255, 11, 76, 216),
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
