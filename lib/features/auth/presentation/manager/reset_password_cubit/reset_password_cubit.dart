import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/auth/data/models/reset_password/reset_password_request.dart';
import 'package:smart_medi/features/auth/data/repos/password_recovery_repo/password_recovery_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.passwordRecoveryRepo) : super(ResetPasswordInitial());
  final PasswordRecoveryRepo passwordRecoveryRepo;

  Future<void> resetPassword({required ResetPasswordRequest resetPasswordRequest}) async {
    emit(ResetPasswordLoading());
    final result = await passwordRecoveryRepo.resetPassword(resetPasswordRequest: resetPasswordRequest);
    result.fold(
      (failure) => emit(ResetPasswordFailure(message: failure.message)),
      (_) => emit(ResetPasswordSuccess()),
    );
  }
}