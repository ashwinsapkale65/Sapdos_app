import 'dart:convert';
import 'package:sapdos_app/core/network/api_client.dart';
import 'package:sapdos_app/features/onboarding/register/domain/entities/user_entity.dart';

abstract class RegisterUserRemote {
  Future<UserEntity> registerUser(UserEntity user);
}

class RegisterRemoteImpl implements RegisterUserRemote {

  final CustomAPIClient apiClient;

  RegisterRemoteImpl({required this.apiClient});

  @override
  Future<UserEntity> registerUser(UserEntity user) async {
    const endpoint = 'api/Credentials/Register';

    try {
      final responseData = await apiClient.post(endpoint, user.toJson());

      return UserEntity.fromJson(responseData);
    } catch (e) {
      rethrow; 
    }
  }
}
