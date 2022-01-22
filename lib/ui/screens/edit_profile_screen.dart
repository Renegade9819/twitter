import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:twitter/core/models/user.dart';
import 'package:twitter/core/providers/user_provider.dart';
import 'package:twitter/core/services/service_locator.dart';
import 'package:twitter/core/services/user_service.dart';
import 'package:twitter/utils/form_util.dart';
import 'package:twitter/constants/api_constants.dart' as api;

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  UserService userServiceWeb = serviceLocator<UserService>();

  String? avatarName;
  String? bgName;

  late DateTime birthDate;
  DateTime? updatedBirthDate;
  String displayDate = "";

  FormUtility formUtil = FormUtility();
  GlobalKey<FormState> _editFormKey = GlobalKey<FormState>();

  User? user;
  bool isAvatarPicked = false;
  bool isBgPicked = false;
  late PlatformFile avatarFile;
  late PlatformFile bgFile;

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
                    bool isAvatarUploaded;
                    bool isBgUploaded;
                    if (isUserFieldChanged(updatedName, updatedBday)) {
                      User updatedUser = await userServiceWeb.updateUser(
                        user!.copyWith(
                          name: updatedName,
                          dob: updatedBday,
                        ),
                      );
                      Provider.of<UserProvider>(context, listen: false)
                          .updateLoggedInUser(updatedUser);
                    }
                    if (isAvatarPicked) {
                      isAvatarUploaded = await userServiceWeb.uploadUserAvatar(
                          File(avatarFile.path!), user!.userName);

                      if (isAvatarUploaded) {
                        print("avatar uploaded");
                        User updatedUser =
                            await userServiceWeb.getUser(user!.userName);
                        Provider.of<UserProvider>(context, listen: false)
                            .updateLoggedInUser(updatedUser);
                      } else {
                        print("problem uploading avatar");
                      }
                    }

                    if (isBgPicked) {
                      isBgUploaded = await userServiceWeb.uploadUserBackground(
                          File(bgFile.path!), user!.userName);

                      if (isBgUploaded) {
                        print("background uploaded");
                        User updatedUser =
                            await userServiceWeb.getUser(user!.userName);
                        Provider.of<UserProvider>(context, listen: false)
                            .updateLoggedInUser(updatedUser);
                      } else {
                        print("problem uploading background");
                      }
                    }
                    Navigator.pop(context);
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
                child: buildUserImages(deviceSize),
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

  bool isUserFieldChanged(String updatedName, DateTime updatedBday) {
    if (user!.name != updatedName || birthDate != updatedBday) {
      return true;
    } else {
      return false;
    }
  }

  Widget buildUserImages(Size deviceSize) {
    int? avatarId = user!.avatarId;
    int? bgId = user!.bgId;
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
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.image,
        );

        if (result != null) {
          bgFile = result.files.single;
          setState(() {
            isBgPicked = true;
          });
        }
      },
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: <Widget>[
          Image(
            image: getBg(bgId),
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
    avatarId = null;
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.image,
        );

        if (result != null) {
          avatarFile = result.files.single;
          setState(() {
            isAvatarPicked = true;
          });
        }
      },
      child: Stack(
        children: [
          CircleAvatar(
            minRadius: 40,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              minRadius: 39,
              backgroundImage: getAvatar(),
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

  ImageProvider<Object> getAvatar() {
    int? avatarId = user!.avatarId;
    if (isAvatarPicked) {
      return FileImage(File(avatarFile.path!));
    } else if (avatarId != null) {
      return NetworkImage(api.avatarUrl + "$avatarId");
    } else {
      return const AssetImage("assets/avatars/default_avatar.png");
    }
  }

  ImageProvider<Object> getBg(int? bgId) {
    int? bgId = user!.bgId;
    if (isBgPicked) {
      return FileImage(File(bgFile.path!));
    } else if (bgId != null) {
      return NetworkImage(api.bgUrl + "$bgId");
    } else {
      return const AssetImage("assets/bg/Light_blue.png");
    }
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
