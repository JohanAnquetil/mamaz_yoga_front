import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../../data/user/models/user.dart';
import '../../../data/user/models/user_req_params.dart';
import '../../../domain/user/usecases/get_users.dart';
import '../../../init_config.dart';
import 'user_event.dart';
import 'user_state.dart';

// class UserBloc extends Bloc<UserEvent, UserState> {
//   final FlutterSecureStorage storage = FlutterSecureStorage();
//   UserBloc() : super(const UserState.unknown()) {
//     on<UserLoaded>(_onUserLoaded);
//   }
//   Future<void> _onUserLoaded(UserEvent event, Emitter<UserState> emit) async {
//     emit(UserState.loading());

//     String? token = await storage.read(key: 'token');
//     // Conversion en entier
//     int? idUser = token != null ? int.tryParse(token) : null;

//     if (idUser == null) {
//       emit(const UserState.unauthenticated());
//       return;
//     }

//     if (idUser != "undefined") {
//       final result =
//           await getIt<GetUserUseCase>().call(params: UserParams(idUser));

//       print(result);
//       result.fold((failure) {
//         print(failure);
//       }, (success) {
//         print({state.toString()});
//         emit(UserState.authenticated(
//             UserModel.fromJson(success['data']).toEntity()));
//       });
//     }
//   }
// }

class UserBloc extends Bloc<UserEvent, UserState> {
  final FlutterSecureStorage storage = FlutterSecureStorage();

  UserBloc() : super(const UserState.unknown()) {
    on<UserLoaded>(_onUserLoaded);
  }

  Future<void> _onUserLoaded(UserLoaded event, Emitter<UserState> emit) async {
    emit(UserState.loading());

    try {
      // Lecture du token depuis le stockage sécurisé
      String token = await storage.read(key: 'token') ?? "";
      int idUser = 0;
      print("token in User Bloc: $token");
      // Conversion en entier
      if (token != "") {
        print("entered in User Bloc");
        print("token in bloc condition: $token");
        idUser = JwtDecoder.decode(token)['id'];
      }

      if (idUser == 0) {
        emit(const UserState.unauthenticated());
        return;
      }

      // Appel à l'API pour récupérer les données utilisateur
      final result =
          await getIt<GetUserUseCase>().call(params: UserParams(idUser));
      print("result in Bloc: $result");
      result.fold(
        (failure) {
          emit(UserState.error("Failed to fetch user: $failure"));
        },
        (success) {
          print("succes: $success");
          emit(
            UserState.authenticated(
                UserModel.fromJson(success['data']).toEntity()),
          );
        },
      );
    } catch (e) {
      emit(UserState.error("Unexpected error: ${e.toString()}"));
    }
  }
}
