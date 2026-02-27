import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/app_colors.dart';
import '../cubits/onboarding/onboarding_cubit.dart';
import '../cubits/onboarding/onboarding_state.dart';
import 'home_screen.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/shopping.png",
      "title": "Amazing Products",
      "subtitle": "Discover a wide variety of amazing products every day.",
    },
    {
      "image": "assets/images/delivery1.png",
      "title": "Fast Delivery",
      "subtitle": "Get your favorite items delivered quickly and conveniently.",
    },
    {
      "image": "assets/images/sale.png",
      "title": "Start Shopping!",
      "subtitle": "Start your shopping journey with us today!",
    },
  ];

  void _goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                PageView.builder(
                  controller: _controller,
                  itemCount: _onboardingData.length,
                  onPageChanged: context.read<OnboardingCubit>().onPageChanged,
                  itemBuilder: (_, index) {
                    final data = _onboardingData[index];
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(data['image']!, height: 250),
                          const SizedBox(height: 30),
                          Text(
                            data['title']!,
                            style: const TextStyle(
                              fontSize: 26,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            data['subtitle']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _onboardingData.length,
                          (index) => Container(
                            margin: const EdgeInsets.all(4),
                            width: state.currentIndex == index ? 12 : 8,
                            height: state.currentIndex == index ? 12 : 8,
                            decoration: BoxDecoration(
                              color: state.currentIndex == index
                                  ? AppColors.primary
                                  : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          final cubit = context.read<OnboardingCubit>();
                          if (cubit.isLastPage(_onboardingData.length)) {
                            _goToHome();
                          } else {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 12,
                          ),
                        ),
                        child: Text(
                          state.currentIndex == _onboardingData.length - 1
                              ? 'Start'
                              : 'Next',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: TextButton(
                    onPressed: _goToHome,
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: AppColors.primary, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
