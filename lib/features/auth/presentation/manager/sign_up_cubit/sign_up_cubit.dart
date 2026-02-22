import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/auth/data/models/sign_up/sign_up_request_model.dart';
import 'package:smart_medi/features/auth/data/repos/registration_repo/registration_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.registrationRepo) : super(SignUpInitial());
  final RegistrationRepo registrationRepo;

  Future<void> signUp({required SignUpRequestModel signUpRequestModel}) async {
    emit(SignUpLoading());
    final response = await registrationRepo.signUp(signUpRequestModel: signUpRequestModel);
    response.fold(
          (failure) => emit(SignUpFailure(message: failure.message)),
          (signUpResponse) {
            print('Sign-up successful for email: ${signUpRequestModel.email}');
            return emit(SignUpSuccess(email: signUpRequestModel.email));
          },
    );
  }
}
