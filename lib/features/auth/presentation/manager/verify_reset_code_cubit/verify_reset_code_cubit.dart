import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/auth/data/models/email_request/email_request.dart';
import 'package:smart_medi/features/auth/data/models/verify_reset_code/verify_reset_code_request.dart';
import 'package:smart_medi/features/auth/data/repos/password_recovery_repo/password_recovery_repo.dart';

part 'verify_reset_code_state.dart';

class VerifyResetCodeCubit extends Cubit<VerifyResetCodeState> {
  VerifyResetCodeCubit(this.passwordRecoveryRepo) : super(VerifyResetCodeInitial());
  final PasswordRecoveryRepo passwordRecoveryRepo;

  Future<void> verifyResetCode({required VerifyResetCodeRequest verifyCodeResetRequest}) async {
    emit(VerifyResetCodeLoading());
    final result = await passwordRecoveryRepo.verifyResetCode(verifyResetCodeRequest: verifyCodeResetRequest);
    result.fold(
          (failure) => emit(VerifyResetCodeFailure(message: failure.message)),
          (_) => emit(VerifyResetCodeSuccess(code: verifyCodeResetRequest.code)),
    );
  }

  Future<void> resendResetCode({required EmailRequest emailRequest}) async {
    emit(ResendResetCodeLoading());
    final result = await passwordRecoveryRepo.resendResetCode(emailRequest: emailRequest);
    result.fold(
          (failure) => emit(ResendResetCodeFailure(message: failure.message)),
          (_) => emit(ResendResetCodeSuccess()),
    );
  }
}
