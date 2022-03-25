//@dart=2.9
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery/commons/common.dart';
import 'package:grocery/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery/provider/user_provider.dart';
import 'package:grocery/widgets/loading.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();

  bool hidePass = true;
  bool loading = false;
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      body: user.status == Status.Authenticating
          ? Loading()
          : Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Center(
                    child: Form(
                        key: _formKey,
                        child: ListView(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset(
                                    'assets/images/grocery-logos.jpeg',
                                    width: 100.0,
//                height: 240.0,
                                  )),
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
                                      controller: _name,
                                      decoration: const InputDecoration(
                                          hintText: "Full name",
                                          icon: Icon(Icons.person_outline),
                                          border: InputBorder.none),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "The name field cannot be empty";
                                        }
                                        return null;
                                      },
                                    ),
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
                                      controller: _email,
                                      decoration: const InputDecoration(
                                          hintText: "Email",
                                          icon: Icon(Icons.alternate_email),
                                          border: InputBorder.none),
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
                                      obscureText: hidePass,
                                      decoration: const InputDecoration(
                                          hintText: "Password",
                                          icon: Icon(Icons.lock_outline),
                                          border: InputBorder.none),
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
                                        icon: const Icon(Icons.remove_red_eye),
                                        onPressed: () {
                                          setState(() {
                                            hidePass = !hidePass;
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
                                        if (!await user.signUp(_name.text,
                                            _email.text, _password.text)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content:
                                                      Text("Sign Up failed")));
                                        }
                                        else {
                                          Fluttertoast.showToast(msg: "Account created!");
                                        }
                                      }
                                    },
                                    minWidth: MediaQuery.of(context).size.width,
                                    child: const Text(
                                      "Sign up",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  )),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "I already have an account",
                                      textAlign: TextAlign.center,
                                      style:
                                          TextStyle(color: green, fontSize: 16),
                                    ))),
                          ],
                        )),
                  ),
                ),
                Visibility(
                  visible: loading ?? true,
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white.withOpacity(0.9),
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }

// valueChanged(e) {
//   setState(() {
//     if (e == "male") {
//       groupValue = e;
//       gender = e;
//     } else if (e == "female") {
//       groupValue = e;
//       gender = e;
//     }
//   });
// }

// Future validateForm() async {
//   FormState formState = _formKey.currentState;
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   String ref = "Users";
//   if (formState.validate()) {
//     User user = firebaseAuth.currentUser;
//     if (user == null) {
//       await firebaseAuth
//           .createUserWithEmailAndPassword(
//               email: _email.text,
//               password: _password.text)
//           .then((user) {
//             String id = user.user.uid;
//                 _firestore.collection(ref).doc(id).set({
//                   "username": _name.text,
//                   "email": _email.text,
//                   "userId": id,
//                 });
//               })
//           .catchError((err) => {print('error is: ' + err.toString())});
//
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => const HomePage()));
//     }
//   }
// }
}
