class FormUtility {
  RegExp regexUsername = RegExp(r'^[a-zA-Z0-9]+$');
  RegExp regexName = RegExp(r'^[a-zA-Z]+$');

  String? validateUserName(String? userName) {
    if (userName!.isEmpty) {
      return "Username cannot be blank";
    } else if (!regexUsername.hasMatch(userName)) {
      return "Username can contain only letters & numbers";
    } else if (userName.length < 3) {
      return "Username cannot be less than 3 characters";
    } else if (userName.length > 24) {
      return "Username cannot be more than 24 characters";
    }
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return "Password cannot be blank";
    } else if (password.length < 6 || password.length > 18) {
      return "Password must be 6-18 characters long";
    }
  }

  String? validateName(String? name) {
    if (name!.isEmpty) {
      return "Name cannot be blank";
    }
    if (!regexName.hasMatch(name)) {
      return "Name can only contain letters";
    }
  }

  String? validateDOB(String? dob) {
    if (dob!.isEmpty) {
      return "Date cannot be blank";
    }
  }

  String? loginValidateUsername(String? userName) {
    if (userName!.isEmpty) {
      return "Username cannot be blank";
    }
  }

  String? loginValidatePassword(String? password) {
    if (password!.isEmpty) {
      return "Password cannot be blank";
    }
  }
}
