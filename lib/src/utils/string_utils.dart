class StringUtils {
  static String enumName(
    String enumToString,
  ) {
    final paths = enumToString.split('.');

    return paths[paths.length - 1];
  }
}
