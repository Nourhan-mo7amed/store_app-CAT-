import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/profile/profile_content.dart';
import '../widgets/profile/profile_guest_view.dart';
import 'auth/login_screen.dart';

const _pageBackground = Color(0xFFF6F7FB);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: _pageBackground,
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: user == null
          ? ProfileGuestView(onGoToLogin: () => _goToLogin(context))
          : ProfileContent(user: user, onLogout: () => _onLogout(context)),
    );
  }

  void _goToLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (_) => false,
    );
  }

  Future<void> _onLogout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (!context.mounted) {
      return;
    }
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (_) => false,
    );
  }
}
