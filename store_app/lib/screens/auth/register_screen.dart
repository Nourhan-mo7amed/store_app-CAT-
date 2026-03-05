import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../home_screen.dart';
import '../../widgets/auth/auth_primary_button.dart';
import '../../widgets/auth/auth_scaffold.dart';
import '../../widgets/auth/auth_switch_link.dart';
import '../../widgets/auth/auth_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _onRegister() async {
    final fullName = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (fullName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all required fields.')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password and confirm password do not match.'),
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(fullName);

      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (_) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? 'Register failed.')));
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Create account',
      subtitle: 'Set up your account to start ordering in minutes.',
      footer: AuthSwitchLink(
        question: 'Already have an account?',
        actionText: 'Login',
        onTap: () {
          Navigator.pop(context);
        },
      ),
      children: [
        AuthTextField(
          label: 'Full name',
          hint: 'Name',
          icon: Icons.person_outline,
          controller: _nameController,
        ),
        const SizedBox(height: 14),
        AuthTextField(
          label: 'Email',
          hint: 'Email',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          controller: _emailController,
        ),
        const SizedBox(height: 14),
        AuthTextField(
          label: 'Password',
          hint: 'Password',
          icon: Icons.lock_outline,
          controller: _passwordController,
          isPassword: true,
        ),
        const SizedBox(height: 14),
        AuthTextField(
          label: 'Confirm password',
          hint: 'Confirm your password',
          icon: Icons.lock_person_outlined,
          controller: _confirmPasswordController,
          isPassword: true,
        ),
        const SizedBox(height: 18),
        AuthPrimaryButton(
          label: _isLoading ? 'Loading...' : 'Register',
          onPressed: _isLoading ? () {} : _onRegister,
        ),
      ],
    );
  }
}
