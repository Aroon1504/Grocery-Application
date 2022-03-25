//@dart=2.9

import 'package:flutter/material.dart';
import 'package:grocery/commons/common.dart';
import 'package:grocery/provider/user_provider.dart';
import 'package:grocery/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  // bool loading = false;
  // bool isLogedin = false;
  bool hidepass = true;

  // @override
  // void initState() {
  //   super.initState();
  //   isSignedIn();
  // }
  //
  // void isSignedIn() async {
  //   setState(() {
  //     loading = true;
  //   });
  //
  //   User user = await firebaseAuth.currentUser;
  //   if (user != null) {
  //     setState(() => isLogedin = true);
  //   }
  //
  //   if (isLogedin) {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => const HomePage()));
  //   }
  //
  //   setState(() {
  //     loading = false;
  //   });
  // }

//  Future handleSignIn() async {
//    setState(() {
//      loading = true;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      body: user.status == Status.Authenticating
          ? Loading()
          : ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Container(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/grocery-logos.jpeg',
                        width: 100.0,
//                height: 220.0,
                      )),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Center(
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey.withOpacity(0.2),
                                  elevation: 0.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: TextFormField(
                                      controller: _email,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email",
                                        icon: Icon(Icons.alternate_email),
                                      ),
                                      // ignore: missing_return
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          Pattern pattern =
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          RegExp regex = RegExp(pattern);
                                          if (!regex.hasMatch(value)) {
                                            return 'Please make sure your email address is valid';
                                          } else {
                                            return null;
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey.withOpacity(0.2),
                                  elevation: 0.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: ListTile(
                                      title: TextFormField(
                                        controller: _password,
                                        obscureText: hidepass,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          icon: Icon(Icons.lock_outline),
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "The password field cannot be empty";
                                          } else if (value.length < 6) {
                                            return "the password has to be at least 6 characters long";
                                          }
                                          return null;
                                        },
                                      ),
                                      trailing: IconButton(
                                          icon:
                                              const Icon(Icons.remove_red_eye),
                                          onPressed: () {
                                            setState(() {
                                              hidepass = !hidepass;
                                            });
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: green,
                                    elevation: 0.0,
                                    child: MaterialButton(
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          if (!await user.signIn(
                                              _email.text, _password.text)) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "Sign In failed")));
                                          }
                                        }
                                      },
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      child: const Text(
                                        "Login",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                    )),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Forgot password",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                          onTap: () {
                                            user.signup();
                                          },
                                          child: const Text(
                                            "Create an account",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color: black),
                                          ))),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                // Visibility(
                //   visible: loading ?? true,
                //   child: Center(
                //     child: Container(
                //       alignment: Alignment.center,
                //       color: Colors.white.withOpacity(0.9),
                //       child: const CircularProgressIndicator(
                //         valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
    );
  }
}
