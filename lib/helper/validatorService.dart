extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
      r'`~{};:/?.,<>/=+|\(-_*&^%$#@![0-9]',
    ).hasMatch(this);
  }
}
