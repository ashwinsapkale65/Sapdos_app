import 'package:sapdos_app/features/onboarding/register/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> registerUser(UserEntity user);

}
