import 'package:dio/dio.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/data/models/picked_document.dart';

class OrganizationSignUpRequestModel {
  const OrganizationSignUpRequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.organizationName,
    required this.organizationType,
    this.description,
    required this.address,
    this.city,
    this.state,
    this.zipCode,
    this.country,
    this.website,
    this.ssn,
    this.documents = const [],
  });

  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final String organizationName;
  final String organizationType;
  final String? description;
  final String address;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? country;
  final String? website;
  final String? ssn;
  final List<PickedDocument> documents;

  Future<FormData> toFormData() async {
    final formData = FormData();

    void addField(String key, String? value) {
      if (value != null && value.trim().isNotEmpty) {
        formData.fields.add(MapEntry(key, value));
      }
    }

    addField('FirstName', firstName);
    addField('LastName', lastName);
    addField('Email', email);
    addField('Password', password);
    addField('PhoneNumber', phoneNumber);
    addField('OrganizationName', organizationName);
    addField('OrganizationType', organizationType);
    addField('Description', description);
    addField('Address', address);
    addField('City', city);
    addField('State', state);
    addField('ZipCode', zipCode);
    addField('Country', country);
    addField('Website', website);
    addField('SSN', ssn);

    for (final document in documents) {
      formData.fields.add(MapEntry('DocumentTypes', document.type));
      formData.fields.add(MapEntry('DocumentNames', document.name));

      if (document.bytes != null) {
        formData.files.add(
          MapEntry(
            'Documents',
            MultipartFile.fromBytes(document.bytes!, filename: document.name),
          ),
        );
      } else if (document.filePath != null) {
        formData.files.add(
          MapEntry(
            'Documents',
            await MultipartFile.fromFile(
              document.filePath!,
              filename: document.name,
            ),
          ),
        );
      }
    }

    return formData;
  }
}
