import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:twitter/core/models/user.dart';
import 'package:twitter/core/providers/user_provider.dart';
import 'package:twitter/core/services/service_locator.dart';
import 'package:twitter/core/services/user_service.dart';
import 'package:twitter/core/viewstate.dart';
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
  UserProvider userProvider = serviceLocator<UserProvider>();

  String? avatarName;
  String? bgName;

  late DateTime birthDate;
  DateTime? updatedBirthDate;
  String displayDate = "";

  FormUtility formUtil = FormUtility();
  final GlobalKey<FormState> _editFormKey = GlobalKey<FormState>();

  User? loggedInUser;
  bool isAvatarPicked = false;
  bool isBgPicked = false;
  late PlatformFile avatarFile;
  late PlatformFile bgFile;

  @override
  void initState() {
    loggedInUser = context.read<UserProvider>().loggedInUser;
    displayDate = DateFormat.yMd().format(loggedInUser!.dob);
    birthDate = loggedInUser!.dob;
    nameController.text = loggedInUser!.name;
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
              child: context.watch<UserProvider>().state == ViewState.busy
                  ? Center(
                      child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          height: 10,
                          width: 10,
                          child: const CircularProgressIndicator()),
                    )
                  : TextButton(
                      onPressed: () async {
                        if (_editFormKey.currentState!.validate()) {
                          String updatedName = nameController.text.trim();
                          DateTime updatedBday = updatedBirthDate ?? birthDate;
                          bool isAvatarUploaded;
                          bool isBgUploaded;
                          if (isUserFieldChanged(updatedName, updatedBday)) {
                            User updatedUser = loggedInUser!.copyWith(
                              name: updatedName,
                              dob: updatedBday,
                            );
                            await context
                                .read<UserProvider>()
                                .updateUserDetails(updatedUser);
                          }
                          if (isAvatarPicked) {
                            isAvatarUploaded = await context
                                .read<UserProvider>()
                                .changeAvatar(File(avatarFile.path!),
                                    loggedInUser!.userName);

                            if (isAvatarUploaded) {
                              print("avatar uploaded");
                            } else {
                              print("problem uploading avatar");
                            }
                          }

                          if (isBgPicked) {
                            isBgUploaded = await context
                                .read<UserProvider>()
                                .changeBackground(
                                    File(bgFile.path!), loggedInUser!.userName);

                            if (isBgUploaded) {
                              print("background uploaded");
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
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                    ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: SizedBox(
                  height: deviceSize.height * 0.2,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
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
                              image: getBg(),
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
                      ),
                      Positioned(
                        top: deviceSize.height * 0.14,
                        left: deviceSize.width * 0.03,
                        child: GestureDetector(
                          onTap: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles(
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
                        ),
                      ),
                    ],
                  ),
                ),
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
    if (loggedInUser!.name != updatedName || birthDate != updatedBday) {
      return true;
    } else {
      return false;
    }
  }

  ImageProvider<Object> getAvatar() {
    int? avatarId = loggedInUser!.avatarId;
    if (isAvatarPicked) {
      return FileImage(File(avatarFile.path!));
    } else if (avatarId != null) {
      return NetworkImage(api.avatarUrl + "$avatarId");
    } else {
      return const AssetImage("assets/avatars/default_avatar.png");
    }
  }

  ImageProvider<Object> getBg() {
    int? bgId = loggedInUser!.bgId;
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
