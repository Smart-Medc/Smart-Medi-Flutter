import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/auth/data/models/email_request/email_request.dart';
import 'package:smart_medi/features/auth/data/repos/password_recovery_repo/password_recovery_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.passwordRecoveryRepo) : super(ForgetPasswordInitial());
  final PasswordRecoveryRepo passwordRecoveryRepo;

  Future<void> forgetPassword({required EmailRequest emailRequest}) async {
    emit(ForgetPasswordLoading());
    final result = await passwordRecoveryRepo.forgotPassword(emailRequest: emailRequest);
    result.fold(
          (failure) => emit(ForgetPasswordFailure(message: failure.message)),
          (_) => emit(ForgetPasswordSuccess(email: emailRequest.email)),
    );
  }
}
