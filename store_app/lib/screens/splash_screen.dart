import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../core/app_colors.dart';
import '../cubits/splash/splash_cubit.dart';
import '../cubits/splash/splash_state.dart';
import 'home_screen.dart';
import 'onbording.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..start(),
      child: BlocListener<SplashCubit, SplashState>(
        listenWhen: (previous, current) =>
            previous.status != current.status &&
            current.status == SplashStatus.completed,
        listener: (context, state) {
          final user = FirebaseAuth.instance.currentUser;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  user != null ? const HomeScreen() : const OnBoardingScreen(),
            ),
          );
        },
        child: const Scaffold(
          backgroundColor: AppColors.primary,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Image(
                      image: AssetImage('assets/images/shopping.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Store App',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 30),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
