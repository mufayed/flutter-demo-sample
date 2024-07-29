class Images {
  Images._();

  static const String icProfile1 = 'assets/images/profile_1.png';
  static const String icProfile2 = 'assets/images/profile_2.png';
  static const String icProfile3 = 'assets/images/profile_3.png';
  static const String icProfile4 = 'assets/images/profile_4.png';

  static getProfileImage({required String? profileImageId}) {
    switch (profileImageId) {
      case '1':
        return icProfile1;
      case '2':
        return icProfile2;
      case '3':
        return icProfile3;
      case '4':
        return icProfile4;
      default:
        return icProfile1;
    }
  }
}
