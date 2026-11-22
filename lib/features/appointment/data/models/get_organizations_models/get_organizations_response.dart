class GetOrganizationsResponse {

  GetOrganizationsResponse({
    required this.id,
    required this.name,
    required this.type,
    required this.address,
    this.city,
    this.nextAvailable,
    required this.rating,
    required this.reviewCount,
    required this.specializations,
  });

  factory GetOrganizationsResponse.fromJson(Map<String, dynamic> json) {
    return GetOrganizationsResponse(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      address: json['address'] ?? '',
      city: json['city'],
      nextAvailable: json['nextAvailable'],
      rating: (json['rating'] ?? 0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      specializations: (json['specializations'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
    );
  }
  final String id;
  final String name;
  final String type;
  final String address;
  final String? city;
  final String? nextAvailable;
  final double rating;
  final int reviewCount;
  final List<String> specializations;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'address': address,
      'city': city,
      'nextAvailable': nextAvailable,
      'rating': rating,
      'reviewCount': reviewCount,
      'specializations': specializations,
    };
  }
}