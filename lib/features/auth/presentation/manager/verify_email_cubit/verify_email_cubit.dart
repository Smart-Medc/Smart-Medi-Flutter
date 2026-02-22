import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/auth/data/models/login/login_response.dart';
import 'package:smart_medi/features/auth/data/models/verify_email/verify_email_request.dart';
import 'package:smart_medi/features/auth/data/repos/registration_repo/registration_repo.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit(this.registrationRepo) : super(VerifyEmailInitial());
  final RegistrationRepo registrationRepo;

  Future<void> verifyEmail({required VerifyEmailRequest verifyEmailRequest}) async {
    emit(VerifyEmailLoading());
    final result = await registrationRepo.verifyEmail(verifyEmailRequest: verifyEmailRequest);
    result.fold(
          (failure) => emit(VerifyEmailFailure(message: failure.message)),
          (loginResponse) => emit(VerifyEmailSuccess(loginResponse: loginResponse)),
    );
  }

  Future<void> resendVerificationCode({required String email}) async {
    emit(ResendCodeLoading());
    final result = await registrationRepo.resendVerificationCode(email: email);
    result.fold(
          (failure) => emit(ResendCodeFailure(message: failure.message)),
          (_) => emit(ResendCodeSuccess()),
    );
  }
}
