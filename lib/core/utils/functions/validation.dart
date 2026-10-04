String? emailValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Email is required';
  }

  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  if (!emailRegex.hasMatch(value.trim())) {
    return 'Please enter a valid email';
  }

  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }

  return null;
}

String? nameValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your name';
  }
  if (value.trim().length < 3) {
    return 'Name must be at least 3 characters';
  }
  return null;
}

String? phoneValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your phone number';
  }
  final phone = value.trim();
  final phoneRegex = RegExp(r'^01[0125][0-9]{8}$');
  if (!phoneRegex.hasMatch(phone)) {
    return 'Please enter a valid Egyptian phone number';
  }
  return null;
}
