import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/providers/user_provider.dart';
import 'package:twitter/services/service_locator.dart';
import 'package:twitter/services/user_service_api.dart';
import 'package:twitter/utils/form_util.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime birthDate = DateTime.now();
  String displayDate = "";

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  FormUtility formUtil = FormUtility();

  UserServiceAPI userServiceWeb = serviceLocator<UserServiceAPI>();

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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            width: screenWidth - 60,
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
              controller: userNameController,
              validator: formUtil.validateUserName,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            width: screenWidth - 60,
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              obscureText: true,
              controller: passwordController,
              validator: formUtil.validatePassword,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            width: screenWidth - 60,
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Display Name',
              ),
              controller: nameController,
              validator: formUtil.validateName,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            width: screenWidth - 60,
            child: TextFormField(
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
              validator: formUtil.validateDOB,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: screenWidth - 60,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  User user = User(
                    userName: userNameController.text.trim(),
                    password: passwordController.text.trim(),
                    name: nameController.text,
                    dob: birthDate,
                    joinDate: DateTime.now(),
                  );

                  await validateSignUp(user, context);
                }
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
        ],
      ),
    );
  }

  Future<void> validateSignUp(User user, BuildContext context) async {
    bool isRegisterSuccessfull = await userServiceWeb.registerUser(user);

    if (isRegisterSuccessfull) {
      User newUser = await userServiceWeb.getUser(user.userName);

      print(newUser.toString());

      Provider.of<UserProvider>(context, listen: false)
          .setLoggedInUser(newUser);

      Navigator.pushReplacementNamed(context, '/home');
    } else {
      const snackBar = SnackBar(
        content: Text("User already exists."),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> _selectBirthDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
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
