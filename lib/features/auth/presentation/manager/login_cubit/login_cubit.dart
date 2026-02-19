import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/auth/data/models/login/login_request.dart';
import 'package:smart_medi/features/auth/data/models/login/login_response.dart';
import 'package:smart_medi/features/auth/data/repos/auth_repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> login({required LoginRequest loginRequest}) async {
    emit(LoginLoading());
    final result = await authRepo.login(loginRequest: loginRequest);
    result.fold(
          (failure) => emit(LoginFailure(message: failure.message)),
          (loginResponse) => emit(LoginSuccess(loginResponse: loginResponse)),
    );
  }
}
