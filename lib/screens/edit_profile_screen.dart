import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/providers/user_provider.dart';
import 'package:twitter/services/service_locator.dart';
import 'package:twitter/services/user_service_api.dart';
import 'package:twitter/utils/form_util.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  UserServiceAPI userServiceWeb = serviceLocator<UserServiceAPI>();

  String? avatarName;
  String? bgName;

  late DateTime birthDate;
  DateTime? updatedBirthDate;
  String displayDate = "";

  FormUtility formUtil = FormUtility();
  GlobalKey<FormState> _editFormKey = GlobalKey<FormState>();

  User? user;

  @override
  void initState() {
    user = Provider.of<UserProvider>(context, listen: false).loggedInUser;
    displayDate = DateFormat.yMd().format(user!.dob);
    birthDate = user!.dob;
    nameController.text = user!.name;
    dateController.text = displayDate;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    dateController.dispose();
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
                onPressed: () async {
                  if (_editFormKey.currentState!.validate()) {
                    String updatedName = nameController.text.trim();
                    DateTime updatedBday = updatedBirthDate ?? birthDate;
                    if (user!.name != updatedName || birthDate != updatedBday) {
                      User updatedUser = await userServiceWeb.updateUser(
                        user!.copyWith(
                          name: updatedName,
                          dob: updatedBday,
                        ),
                      );
                      Provider.of<UserProvider>(context, listen: false)
                          .updateLoggedInUser(updatedUser);
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                    }
                  }
                },
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: buildUserImages(deviceSize, user!),
              ),
              const SizedBox(height: 40),
              Form(
                key: _editFormKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: (deviceSize.width * 0.03)),
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: "Name",
                        ),
                        validator: formUtil.validateName,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: (deviceSize.width * 0.03)),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUserImages(Size deviceSize, User user) {
    int? avatarId = user.avatarId;
    int? bgId = user.bgId;
    return SizedBox(
      height: deviceSize.height * 0.2,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: <Widget>[
          buildBackground(bgId),
          Positioned(
            top: deviceSize.height * 0.14,
            left: deviceSize.width * 0.03,
            child: buildAvatar(avatarId),
          ),
        ],
      ),
    );
  }

  Widget buildBackground(int? bgId) {
    return GestureDetector(
      onTap: () => print("background tapped"),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: <Widget>[
          Image(
            image: bgId != null
                ? AssetImage("$bgId")
                : const AssetImage("assets/bg/Light_blue.png"),
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

  Widget buildAvatar(int? avatarId) {
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
              backgroundImage: avatarId != null
                  ? AssetImage("$avatarId")
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
      initialDate: birthDate,
      firstDate: DateTime(1990),
      lastDate: DateTime(2101),
    );
    if (datePicked != null && datePicked != selectedDate) {
      setState(() {
        selectedDate = datePicked;
        updatedBirthDate = DateUtils.dateOnly(selectedDate);
        displayDate = DateFormat.yMd().format(selectedDate);
        //dateFormat.add_yMd().format(selectedDate);
      });
    }
  }
}
