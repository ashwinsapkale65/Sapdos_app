import 'package:sapdos_app/features/onboarding/register/domain/entities/user_entity.dart';
import 'package:sapdos_app/features/onboarding/register/domain/repositories/register_repository.dart';

class RegisterUserUseCase {
  final UserRepository userRepository;

  RegisterUserUseCase({required this.userRepository});

  Future<UserEntity> execute(UserEntity user) async {

    return await userRepository.registerUser(user);
  }
}
