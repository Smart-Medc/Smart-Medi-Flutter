import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/auth_helper.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

/// Example of how to implement a logout button in any widget
/// You can copy this code to your profile screen, settings, or app bar
class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.logout),
      onPressed: () => _handleLogout(context),
      tooltip: 'Logout',
    );
  }

}
Future<void> _handleLogout(BuildContext context) async {
  // Show confirmation dialog
  final shouldLogout = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to logout?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child:  Text('Cancel',style: AppStyles.textStyle14W400Black,),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child:  Text('Logout',style: AppStyles.textStyle14W400DarkGrey,),
        ),
      ],
    ),
  );

  if (shouldLogout == true && context.mounted) {
    // Show loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // Clear all stored auth data
    await AuthHelper.logout();

    if (context.mounted) {
      // Close loading dialog
      Navigator.pop(context);

      // Navigate to login screen
      GoRouter.of(context).go(AppRoutes.loginView);
    }
  }
}

/// Example: Text Button version
class LogoutTextButton extends StatelessWidget {
  const LogoutTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.logout,color: AppColors.black,),
      label:  Text('Logout',style: AppStyles.textStyle12W600Black,),
      onPressed: () => _handleLogout(context),
    );
  }
}

/// Example: ListTile version (for settings/profile screen)
class LogoutListTile extends StatelessWidget {
  const LogoutListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.logout, color: Colors.red),
      title: const Text('Logout', style: TextStyle(color: Colors.red)),
      onTap: () => _handleLogout(context),
    );
  }
}

