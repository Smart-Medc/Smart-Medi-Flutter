// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smart_medi/features/organization_feature/organization_sign_up/data/models/organization_sign_up_models/organization_sign_up_request_model.dart';
// import 'package:smart_medi/features/organization_feature/organization_sign_up/data/models/picked_document.dart';
// import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/manager/organization_sign_up_cubit/organization_sign_up_cubit.dart';
// import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/views/widgets/organization_basic_info_step.dart';
// import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/views/widgets/organization_details_step.dart';
// import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/views/widgets/organization_documents_step.dart';
//
// class OrganizationSignUpFields extends StatefulWidget {
//   const OrganizationSignUpFields({super.key});
//
//   @override
//   State<OrganizationSignUpFields> createState() => _OrganizationSignUpFieldsState();
// }
//
// class _OrganizationSignUpFieldsState extends State<OrganizationSignUpFields> {
//   int _currentStep = 0;
//
//   final _basicInfoFormKey = GlobalKey<FormState>();
//   final _detailsFormKey = GlobalKey<FormState>();
//
//   // Step 1
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final phoneNumberController = TextEditingController();
//   final organizationNameController = TextEditingController();
//   final organizationTypeController = TextEditingController();
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//
//   // Step 2
//   final describtionController = TextEditingController();
//   final ssnController = TextEditingController();
//   final addressController = TextEditingController();
//   final websiteController = TextEditingController();
//   bool _isAgreeWithTerms = false;
//   String? _termsErrorText;
//
//   // Step 3
//   List<PickedDocument> _documents = [];
//
//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     phoneNumberController.dispose();
//     organizationNameController.dispose();
//     organizationTypeController.dispose();
//     describtionController.dispose();
//     ssnController.dispose();
//     addressController.dispose();
//     websiteController.dispose();
//     super.dispose();
//   }
//
//   void _handleNextFromBasicInfo() {
//     if (_basicInfoFormKey.currentState!.validate()) {
//       setState(() => _currentStep = 1);
//     }
//   }
//
//   void _handleNextFromDetails() {
//     if (_detailsFormKey.currentState!.validate()) {
//       if (!_isAgreeWithTerms) {
//         setState(() {
//           _termsErrorText = 'You must agree to the terms & conditions';
//         });
//         return;
//       }
//       setState(() => _currentStep = 2);
//     }
//   }
//
//   void _handleSubmit() {
//     final requestModel = OrganizationSignUpRequestModel(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//       phoneNumber: phoneNumberController.text.trim(),
//       organizationName: organizationNameController.text.trim(),
//       organizationType: organizationTypeController.text.trim(),
//       // Note: "Specialization" has no dedicated field in the API, folded
//       // into Description as the closest match.
//       description: describtionController.text.trim().isEmpty
//           ? null
//           : describtionController.text.trim(),
//       address: addressController.text.trim(),
//       ssn: ssnController.text.trim().isEmpty ? null : ssnController.text.trim(),
//       documents: _documents, firstName: firstNameController.text.trim(), lastName: lastNameController.text.trim(),
//       // Note: "Operating Hours" also has no matching API field, so it's
//       // collected in the UI but not sent yet.
//     );
//
//     context.read<OrganizationSignUpCubit>().registerOrganization(requestModel);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     switch (_currentStep) {
//       case 0:
//         return OrganizationBasicInfoStep(
//           formKey: _basicInfoFormKey,
//           emailController: emailController,
//           passwordController: passwordController,
//           phoneNumberController: phoneNumberController,
//           organizationNameController: organizationNameController,
//           organizationTypeController: organizationTypeController,
//           onNext: _handleNextFromBasicInfo,
//           firstNameController: firstNameController,
//           lastNameController: lastNameController,
//         );
//       case 1:
//         return OrganizationDetailsStep(
//           formKey: _detailsFormKey,
//           describtionController: describtionController,
//           ssnController: ssnController,
//           addressController: addressController,
//           websiteController: websiteController,
//           isAgreeWithTerms: _isAgreeWithTerms,
//           termsErrorText: _termsErrorText,
//           onTermsChanged: (value) {
//             setState(() {
//               _isAgreeWithTerms = value;
//               if (value) _termsErrorText = null;
//             });
//           },
//           onNext: _handleNextFromDetails,
//         );
//       default:
//         return BlocBuilder<OrganizationSignUpCubit, OrganizationSignUpState>(
//           buildWhen: (previous, current) =>
//               current is OrganizationSignUpLoading ||
//               previous is OrganizationSignUpLoading,
//           builder: (context, state) {
//             return OrganizationDocumentsStep(
//               documents: _documents,
//               isSubmitting: state is OrganizationSignUpLoading,
//               onDocumentsChanged: (docs) => setState(() => _documents = docs),
//               onSubmit: _handleSubmit,
//             );
//           },
//         );
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/data/models/organization_sign_up_models/organization_sign_up_request_model.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/data/models/picked_document.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/manager/organization_sign_up_cubit/organization_sign_up_cubit.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/views/widgets/organization_basic_info_step.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/views/widgets/organization_details_step.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/views/widgets/organization_documents_step.dart';

class OrganizationSignUpFields extends StatefulWidget {
  const OrganizationSignUpFields({super.key});

  @override
  State<OrganizationSignUpFields> createState() => _OrganizationSignUpFieldsState();
}

class _OrganizationSignUpFieldsState extends State<OrganizationSignUpFields> {
  int _currentStep = 0;

  final _basicInfoFormKey = GlobalKey<FormState>();
  final _detailsFormKey = GlobalKey<FormState>();

  // Step 1
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final organizationNameController = TextEditingController();
  final organizationTypeController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  // Step 2
  final descriptionController = TextEditingController();
  final ssnController = TextEditingController();
  final addressController = TextEditingController();
  final websiteController = TextEditingController();
  bool _isAgreeWithTerms = false;
  String? _termsErrorText;

  // Step 3
  List<PickedDocument> _documents = [];

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    organizationNameController.dispose();
    organizationTypeController.dispose();
    descriptionController.dispose();
    ssnController.dispose();
    addressController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  void _handleNextFromBasicInfo() {
    if (_basicInfoFormKey.currentState!.validate()) {
      setState(() => _currentStep = 1);
    }
  }

  void _handleNextFromDetails() {
    if (_detailsFormKey.currentState!.validate()) {
      if (!_isAgreeWithTerms) {
        setState(() {
          _termsErrorText = 'You must agree to the terms & conditions';
        });
        return;
      }
      setState(() => _currentStep = 2);
    }
  }

  /// Steps back through the wizard. On step 0 there's nowhere left to go
  /// back to within the wizard, so it navigates to Login explicitly instead
  /// of falling through to the default pop (which could close the app,
  /// since these auth screens navigate with `.replace()` and don't always
  /// leave a previous route on the stack).
  void _goBack() {
    if (_currentStep > 0) {
      setState(() => _currentStep -= 1);
    } else {
      GoRouter.of(context).replace(AppRoutes.loginView);
    }
  }

  void _handleSubmit() {
    final requestModel = OrganizationSignUpRequestModel(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      phoneNumber: phoneNumberController.text.trim(),
      organizationName: organizationNameController.text.trim(),
      organizationType: organizationTypeController.text.trim(),
      // Note: "Specialization" has no dedicated field in the API, folded
      // into Description as the closest match.
      description: descriptionController.text.trim().isEmpty
          ? null
          : descriptionController.text.trim(),
      address: addressController.text.trim(),
      ssn: ssnController.text.trim().isEmpty ? null : ssnController.text.trim(),
      documents: _documents,
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      // Note: "Operating Hours" also has no matching API field, so it's
      // collected in the UI but not sent yet.
    );

    context.read<OrganizationSignUpCubit>().registerOrganization(requestModel);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // We always intercept and handle the back press ourselves, so it
      // never falls through to a default pop that might close the app.
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _goBack();
      },
      child: _buildCurrentStep(),
    );
  }

  Widget _buildCurrentStep() {
    switch (_currentStep) {
      case 0:
        return OrganizationBasicInfoStep(
          lastNameController: lastNameController,
          firstNameController: firstNameController,
          formKey: _basicInfoFormKey,
          emailController: emailController,
          passwordController: passwordController,
          phoneNumberController: phoneNumberController,
          organizationNameController: organizationNameController,
          organizationTypeController: organizationTypeController,
          onNext: _handleNextFromBasicInfo,
        );
      case 1:
        return OrganizationDetailsStep(
          formKey: _detailsFormKey,
          descriptionController: descriptionController,
          ssnController: ssnController,
          addressController: addressController,
          websiteController: websiteController,
          isAgreeWithTerms: _isAgreeWithTerms,
          termsErrorText: _termsErrorText,
          onTermsChanged: (value) {
            setState(() {
              _isAgreeWithTerms = value;
              if (value) _termsErrorText = null;
            });
          },
          onNext: _handleNextFromDetails,
          onBack: _goBack,
        );
      default:
        return BlocBuilder<OrganizationSignUpCubit, OrganizationSignUpState>(
          buildWhen: (previous, current) =>
          current is OrganizationSignUpLoading ||
              previous is OrganizationSignUpLoading,
          builder: (context, state) {
            return OrganizationDocumentsStep(
              documents: _documents,
              isSubmitting: state is OrganizationSignUpLoading,
              onDocumentsChanged: (docs) => setState(() => _documents = docs),
              onSubmit: _handleSubmit,
              onBack: _goBack,
            );
          },
        );
    }
  }
}