import 'package:flutter/material.dart';
import 'package:local_filings/provider/onboarding_provider.dart';
import 'package:provider/provider.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onBoarding = Provider.of<OnBoardingProvider>(context);
    //get current page index
    int index = onBoarding.selectedIndex;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //display current page illustration
            Image.asset(
              'assets/images/onboarding-${index + 1}.png',
              height: 240,
              width: 240,
            ),
            const SizedBox(
              height: 30,
            ),
            //Page indicating dots
            Container(
              width: 40,
              child: Row(
                children: _pageIndicators(context, index),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //Title
            const Text(
              "Lorem ipsum dolor sit amet",
              style: TextStyle(
                  color: Color(0xFFFF832A),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            //Brief description
            Container(
              width: 240,
              child: const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sodales curabitur id commodo netus faucibus ornare.,",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF888888), fontSize: 13, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //List of Widget as page indicators
  List<Widget> _pageIndicators(BuildContext context, int index) {
    List<Widget> _indicators = [];

    for (int i = 0; i < 3; i++) {
      _indicators.add(
        Expanded(
          child: Container(
            height: 10,
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                color: i == index
                    ? const Color(0xFF0E3C6E)
                    : const Color(0xFFDDDDDD),
                shape: BoxShape.circle
                // borderRadius: i == Provider.of<OnBoardingProvider>(context).selectedIndex ? BorderRadius.circular(50) : BorderRadius.circular(25),
                ),
          ),
        ),
      );
    }
    return _indicators;
  }
}
