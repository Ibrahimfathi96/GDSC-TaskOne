import 'package:flutter/material.dart';
import 'package:task_one/CustomWidgets/clipperWidget.dart';
import 'package:task_one/CustomWidgets/text_field_widget.dart';
import 'package:task_one/Screens/animated_list_screen.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register Screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  late bool _isObscured1;
  late bool _isObscured2;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
          child: Form(
            key: formKey,
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
                          controller: nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter a Name';
                            }
                            return null;
                          },
                          isObscured: false,
                          textLabel: 'Full Name',
                          hint: 'Enter Your Name',
                          iconPrefix: Icons.person,
                          inputFieldType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          controller: phoneController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter a Phone Number';
                            }
                            return null;
                          },
                          isObscured: false,
                          textLabel: 'Phone Number',
                          hint: 'Enter Your Phone Number',
                          iconPrefix: Icons.phone,
                          inputFieldType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter an Email';
                              } else if (emailController.text.contains('@') ==
                                      false ||
                                  emailController.text.contains('.') == false) {
                                return ' Please Enter a Valid Email';
                              }
                              return null;
                            },
                            isObscured: false,
                            inputFieldType: TextInputType.emailAddress,
                            textLabel: 'Email',
                            hint: 'Enter Your Email',
                            iconPrefix: Icons.email),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter a Password';
                            }
                            return null;
                          },
                          isObscured: _isObscured1,
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
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Confirm Your Password';
                            }
                            return null;
                          },
                          isObscured: _isObscured2,
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
                            if (formKey.currentState!.validate()) {
                              Navigator.pushNamed(
                                  context, LoginScreen.routeName);
                            }
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
      ),
    );
  }
}
