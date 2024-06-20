import 'package:sapdos_app/features/onboarding/register/data/datasource/register_user_remote.dart';
import 'package:sapdos_app/features/onboarding/register/domain/entities/user_entity.dart';
import 'package:sapdos_app/features/onboarding/register/domain/repositories/register_repository.dart';

class UserRepositoryImpl implements UserRepository {
  RegisterUserRemote registerUserRemote;
  UserRepositoryImpl({required this.registerUserRemote});
  @override
  Future<UserEntity> registerUser(UserEntity user) {
    return registerUserRemote.registerUser(user);
  }
}
