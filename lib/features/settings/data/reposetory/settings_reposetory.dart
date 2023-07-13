import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../authentecation/data/models/login_model.dart';

abstract class SettingsRepo {
   Future<Either<Failure, LoginModel>> getUsersData();
}

class SettingsRepoImpl implements SettingsRepo{
  @override
  Future<Either<Failure, LoginModel>> getUsersData() {
    // TODO: implement getUsersData
    throw UnimplementedError();
  }
}