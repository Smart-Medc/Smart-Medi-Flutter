import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/data_sharing/data/repos/data_sharing_repo.dart';

part 'revoke_access_state.dart';

class RevokeAccessCubit extends Cubit<RevokeAccessState> {
  RevokeAccessCubit(this.dataSharingRepo) : super(RevokeAccessInitial());
  final DataSharingRepo dataSharingRepo;
  Future<void> revokeAccess({required String codeId}) async {
    emit(RevokeAccessLoading());
    final result = await dataSharingRepo.revokeAccess(codeId: codeId);
    result.fold(
      (failure) => emit(RevokeAccessFailure(message: failure.message)),
      (_) => emit(RevokeAccessSuccess()),
    );
  }
}
