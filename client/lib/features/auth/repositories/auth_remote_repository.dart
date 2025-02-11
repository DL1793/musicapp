import 'dart:convert';
import 'package:client/core/constants/server_constant.dart';
import 'package:client/features/auth/model/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import '../../../core/failure/failure.dart';

class AuthRemoteRepository {
  Future<Either<AppFailure, UserModel>> signup({
    required String name,
    required String email,
    required String password,
    required String timestamp,
  }) async {
    try {
      final response = await http.post(Uri.parse(
          '${ServerConstant.serverURL}/auth/signup'
      ),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'timestamp': timestamp,
        },
        ),
      );
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if(response.statusCode != 201){
        //handled the error
        return Left(AppFailure(resBodyMap['detail']));
      }
      return Right(UserModel.fromMap(resBodyMap)
      );
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure,UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
          Uri.parse('http://10.0.2.2:8000/auth/login'
          ),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'email': email,
            'password': password,
          })
      );

      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if(response.statusCode != 200) {
        return Left(AppFailure(resBodyMap['detail']));
      }
      
      return Right(UserModel.fromMap(resBodyMap));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}