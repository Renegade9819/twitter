import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/providers/user_provider.dart';
import 'package:twitter/utils/form_util.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  DateTime birthDate = DateTime.now();
  String displayDate = "";

  FormUtility formUtil = FormUtility();

  User? user;

  @override
  void initState() {
    user = Provider.of<UserProvider>(context, listen: false).loggedInUser;
    displayDate = DateFormat.yMd().format(user!.dob);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          shape: const Border(
            bottom: BorderSide(color: Colors.black12),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Edit profile',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            buildUserImages(deviceSize, user!),
            const SizedBox(height: 40),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: (deviceSize.width * 0.03)),
              child: TextFormField(
                controller: nameController..text = user!.name,
                decoration: const InputDecoration(
                  labelText: "Name",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: (deviceSize.width * 0.03)),
              child: TextFormField(
                decoration: InputDecoration(
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
          ],
        ),
      ),
    );
  }

  Widget buildUserImages(Size deviceSize, User user) {
    String? avatarURL = user.avatarURL;
    return SizedBox(
      height: deviceSize.height * 0.2,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: <Widget>[
          buildBackground(),
          Positioned(
            top: deviceSize.height * 0.14,
            left: deviceSize.width * 0.03,
            child: buildAvatar(avatarURL),
          ),
        ],
      ),
    );
  }

  Widget buildBackground() {
    return GestureDetector(
      onTap: () => print("background tapped"),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: <Widget>[
          Image.network(
            "https://images.unsplash.com/photo-1640100921996-8798b85703c3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=894&q=80",
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black54,
            child: const Icon(
              Icons.edit,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAvatar(String? avatarURL) {
    return GestureDetector(
      onTap: () => print("avatar tapped"),
      child: Stack(
        children: [
          CircleAvatar(
            minRadius: 40,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              minRadius: 39,
              backgroundImage: avatarURL != null
                  ? AssetImage(avatarURL)
                  : const AssetImage("assets/avatars/default_avatar.png"),
            ),
          ),
          const CircleAvatar(
            backgroundColor: Colors.black45,
            minRadius: 40,
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
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
