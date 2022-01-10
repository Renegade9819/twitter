import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:twitter/models/user.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime? birthDate;
  String displayDate = "";

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    nameController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 50.0),
                    child: Image.asset(
                      'assets/images/twitterlogo.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const Text(
                      'Make a Twitter account',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    width: screenWidth - 60,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                      controller: userNameController,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    width: screenWidth - 60,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      controller: passwordController,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    width: screenWidth - 60,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Display Name',
                      ),
                      controller: nameController,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    width: screenWidth - 60,
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Date of Birth',
                        prefixIcon: IconButton(
                          onPressed: () => _selectBirthDate(context),
                          icon: const Icon(
                            Icons.calendar_today,
                          ),
                        ),
                      ),
                      readOnly: true,
                      controller: dateController..text = displayDate,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: screenWidth - 60,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        User user = User();
                        user.userName = userNameController.text;
                        user.password = passwordController.text;
                        user.name = nameController.text;
                        user.dob = birthDate!;
                        SignUpUser(user);
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          const TextSpan(text: 'Have an account already? '),
                          TextSpan(
                              text: 'Sign In',
                              style: const TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                      context, '/signin');
                                }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void SignUpUser(User user) {
    print("${user.userName} ${user.password} ${user.name} ${user.dob}");
  }

  Future<void> _selectBirthDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    int currentMonth = selectedDate.month;
    final DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1990),
      lastDate: DateTime(2101),
    );
    if (datePicked != null && datePicked != selectedDate) {
      setState(() {
        selectedDate = datePicked;
        birthDate = DateUtils.dateOnly(selectedDate);
        displayDate = DateFormat.yMd().format(selectedDate);
        //dateFormat.add_yMd().format(selectedDate);
      });
    }
  }
}
