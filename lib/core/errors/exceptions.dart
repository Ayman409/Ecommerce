class UnableToFindItemException implements Exception {
  String? msg;

  UnableToFindItemException({this.msg});

  @override
  String toString() {
    return msg ?? super.toString();
  }
}

class NoInternetException implements Exception {
  String? msg;

  NoInternetException({this.msg});

  @override
  String toString() {
    return msg ?? super.toString();
  }
}

class CacheException implements Exception {
  String? msg;

  CacheException({this.msg});

  @override
  String toString() {
    return msg ?? super.toString();
  }
}
