import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/auth/data/models/sign_up/sign_up_request_model.dart';
import 'package:smart_medi/features/auth/data/repos/autho_repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> signUp({required SignUpRequestModel signUpRequestModel}) async {
    emit(SignUpLoading());
    final response = await authRepo.signUp(signUpRequestModel: signUpRequestModel);
    response.fold(
          (failure) => emit(SignUpFailure(message: failure.message)),
          (signUpResponse) => emit(SignUpSuccess()),
    );
  }
}
