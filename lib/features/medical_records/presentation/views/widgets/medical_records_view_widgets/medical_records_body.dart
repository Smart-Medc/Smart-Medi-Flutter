import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/core/widgets/app_search_bar.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/medical_records_view_widgets/medical_records_list.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/medical_records_view_widgets/medical_records_summary.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/upload_new_document.dart';
class MedicalRecordsBody extends StatelessWidget {
  const MedicalRecordsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          sliver: SliverMainAxisGroup(
            slivers: [
              const SliverToBoxAdapter(child: CustomAppBar()),
              SliverToBoxAdapter(child: AppHeader(
                title: 'Medical Records',
                subtitle: 'Securely store and manage your health documents',
                actionText: 'Upload Document',
                onActionPressed: () => context.push(AppRoutes.editRecordView),
              )),
              const SliverToBoxAdapter(child: AppSearchBar(hintText: 'Search records by title , type')),
              const SliverToBoxAdapter(child: MedicalRecordsSummary()),
              SliverToBoxAdapter(child: 28.verticalSpace),
              SliverToBoxAdapter(child: Text('Records',style: AppStyles.textStyle24W600Black,)),
              SliverToBoxAdapter(child: 14.verticalSpace),
              const MedicalRecordsList(),
              SliverToBoxAdapter(child: 16.verticalSpace),
              const SliverToBoxAdapter(child: SizedBox(width: double.infinity,child: UploadNewDocument())),
              SliverToBoxAdapter(child: 100.verticalSpace),
            ],
          ),
        ),
      ],
    );
  }
}
