String generateEgyptFlag() {
  String egyptCode = 'eg';
  return egyptCode.toUpperCase().replaceAllMapped(
        RegExp(
          r'[A-Z]',
        ),
        (match) => String.fromCharCode(
          match.group(0)!.codeUnitAt(0) + 127397,
        ),
      );
}
