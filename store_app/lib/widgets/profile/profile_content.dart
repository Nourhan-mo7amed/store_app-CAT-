import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key, required this.user, required this.onLogout});

  final User user;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final displayName = (user.displayName ?? '').trim().isEmpty
        ? 'User'
        : user.displayName!;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 4),
                  color: AppColors.primary.withValues(alpha: 0.12),
                ),
                child: const Icon(
                  Icons.person,
                  size: 58,
                  color: AppColors.primary,
                ),
              ),
              Positioned(
                right: -2,
                bottom: 6,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: 17,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            displayName,
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email ?? 'No email',
            style: TextStyle(
              color: isDark ? Colors.grey.shade400 : Colors.black54,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 24),
          _buildProfileOption(
            context,
            isDark: isDark,
            icon: Icons.person_outline,
            title: 'Edit Profile',
          ),
          _buildProfileOption(
            context,
            isDark: isDark,
            icon: Icons.location_on_outlined,
            title: 'My Addresses',
          ),
          _buildProfileOption(
            context,
            isDark: isDark,
            icon: Icons.receipt_long_outlined,
            title: 'Order History',
          ),
          _buildProfileOption(
            context,
            isDark: isDark,
            icon: Icons.favorite_border,
            title: 'Favorites',
          ),
          _buildProfileOption(
            context,
            isDark: isDark,
            icon: Icons.payment_outlined,
            title: 'Payment Methods',
          ),
          _buildProfileOption(
            context,
            isDark: isDark,
            icon: Icons.notifications_outlined,
            title: 'Notifications',
          ),
          _buildProfileOption(
            context,
            isDark: isDark,
            icon: Icons.help_outline,
            title: 'Help & Support',
          ),
          _buildProfileOption(
            context,
            isDark: isDark,
            icon: Icons.settings_outlined,
            title: 'Settings',
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: onLogout,
              child: const Text(
                'Logout',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required bool isDark,
    required IconData icon,
    required String title,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.grey.shade700 : Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : Colors.grey.shade100,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: isDark ? Colors.grey.shade400 : Colors.grey,
        ),
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('$title coming soon')));
        },
      ),
    );
  }
}
