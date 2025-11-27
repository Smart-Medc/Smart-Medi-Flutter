import 'package:flutter/material.dart';

/// App shadow and elevation presets used across the app.
///
/// - small:  0 1px 2px rgba(0,0,0,0.08)
/// - medium: 0 4px 6px rgba(0,0,0,0.1)
/// - large:  0 8px 12px rgba(0,0,0,0.12)
class AppShadows {
  AppShadows._(); // private constructor to prevent instantiation

  // Small shadow (cards)
  static const BoxShadow _smallBox = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.08),
    offset: Offset(0, 1),
    blurRadius: 2,
  );
  static const List<BoxShadow> small = <BoxShadow>[_smallBox];

  // Medium shadow (modals)
  static const BoxShadow _mediumBox = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.10),
    offset: Offset(0, 4),
    blurRadius: 6,
  );
  static const List<BoxShadow> medium = <BoxShadow>[_mediumBox];

  // Large shadow (floating buttons)
  static const BoxShadow _largeBox = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.12),
    offset: Offset(0, 8),
    blurRadius: 12,
  );
  static const List<BoxShadow> large = <BoxShadow>[_largeBox];

  // Corresponding material-like elevation values (optional helpers)
  static const double smallElevation = 1.0;
  static const double mediumElevation = 4.0;
  static const double largeElevation = 8.0;
}