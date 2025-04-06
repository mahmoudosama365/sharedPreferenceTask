import 'package:flutter/material.dart';
import 'package:flutter_application_2/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreenDemo extends StatefulWidget {
  static const String routeName = 'onboarding';

  const IntroScreenDemo({super.key});
  @override
  State<IntroScreenDemo> createState() => _IntroScreenDemoState();
}

class _IntroScreenDemoState extends State<IntroScreenDemo> {
  // 1. Define a `GlobalKey` as part of the parent widget's state
  final _introKey = GlobalKey<IntroductionScreenState>();
  final String text = '';
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: const Color(0xff202020),
      key: _introKey,
      pages: [
        PageViewModel(
          
          titleWidget: Image.asset('assets/Group 31.png'),
          bodyWidget: Column(
            children: [
              Image.asset('assets/firstboard.png'),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Welcome To Islami App',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffE2BE7F)),
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset('assets/Group 31.png'),
          bodyWidget: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  'assets/secondboard.png',
                  fit: BoxFit.fill,
                ),
              ),
              const Text(
                'Welcome To Islami',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffE2BE7F)),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                textAlign: TextAlign.center,
                'We Are Very Excited To Have You In Our',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffE2BE7F)),
              ),
              const Text(
                'Community',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffE2BE7F),
                ),
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset('assets/Group 31.png'),
          bodyWidget: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 40),
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  'assets/thirdboard.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              const Text(
                'Reading the Quran',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffE2BE7F)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                textAlign: TextAlign.center,
                'Read, and your Lord is the Most Generous',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffE2BE7F)),
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset('assets/Group 31.png'),
          bodyWidget: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  'assets/fourthboard.png',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Bearish',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffE2BE7F)),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                textAlign: TextAlign.center,
                'Praise the name of your Lord, the Most High',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffE2BE7F)),
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset('assets/Group 31.png',),
          bodyWidget: Column(
            children: [
              SizedBox(
                height: 270,
                width: double.infinity,
                child: Image.asset(
                  'assets/fifthboard.png',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Holy Quran Radio',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffE2BE7F)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                textAlign: TextAlign.center,
                'You can listen to the Holy Quran Radio',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffE2BE7F)),
              ),
              const Text(
                textAlign: TextAlign.center,
                'through the application for free and easily',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffE2BE7F)),
              ),
            ],
          ),
        ),
      ],
      dotsDecorator:  const DotsDecorator(
        activeColor: Color(0xffFFD482),
      ),
      next: const Text(
        'Next',
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xffE2BE7F)),
      ),
      nextStyle: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.only(left: 60))),
      back: const Text(
        'Back',
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xffE2BE7F)),
      ),
      done: const Text(
        'Finish',
        style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(0xffE2BE7F)),
      ),
      backStyle: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.only(right: 60))),
      doneStyle: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.only(left: 60))),
      
      onDone: () {
        Navigator.of(context).pushNamed(HomeScreen.routeName);
      },

      showNextButton: true,
      showDoneButton: true,
      showBackButton: true,
    );
  }
}
