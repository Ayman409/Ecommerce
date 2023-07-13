abstract class Failure {
  final String? error;
  Failure([this.error]);
  String get failureMsg;
}

class NoInternetFailure extends Failure {
  NoInternetFailure(super.error);
  @override
  String get failureMsg => error ?? 'لا يوجد إتصال بالإنترنت!';
}

//Failure for dio exceptions (i.e timeout, status codes errors)
class TimeoutFailure extends Failure {
  TimeoutFailure([super.error]);

  @override
  String get failureMsg => error ?? 'نفذ وقت الاتصال بالخادم!';
}

class ServerFailure extends Failure {
  ServerFailure([super.error]);

  @override
  String get failureMsg =>
      error ?? 'حدث خطأ عند الإتصال بالخادم! حاول مجدداً لاحقاً';
}

class CacheFailure extends Failure {
  CacheFailure([super.error]);

  @override
  String get failureMsg => error ?? 'لايوجد بيانات في ذاكرة التخزين';
}

class UndefinedFailure extends Failure {
  UndefinedFailure([super.error]);

  @override
  String get failureMsg => error ?? 'حدث خطأ ما! حاول مجدداً لاحقا';
}

class UnableToFindItemFailure extends Failure {
  UnableToFindItemFailure([super.error]);
  @override
  String get failureMsg => error ?? 'لم يتم العثور على الصنف ';
}
