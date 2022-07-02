import 'package:flutter/material.dart';
import 'package:local_filings/provider/onboarding_provider.dart';
import 'package:local_filings/view/screens/home/home.dart';
import 'package:provider/provider.dart';

import 'onboarding_widget.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final onBoarding = Provider.of<OnBoardingProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 onBoarding.selectedIndex!=2? TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                          color: const Color(0xFFB5B5B5),
                          fontSize: 15
                      ),
                    )) : Container()
              ],
            ),
            Expanded(
              child: PageView.builder(
                itemCount: 3,
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return const OnBoardingWidget();
                },
                onPageChanged: (index) => onBoarding.setSelectIndex(index),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        if (onBoarding.selectedIndex != 0) {
                          _pageController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }
                      },
                      child: const Text(
                        "prev",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF0E3C6E)
                        ),
                      )
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if(onBoarding.selectedIndex==2) {
                          Navigator.pushNamed(context, '/register');
                        } else{
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }
                      },
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all(const Color(
                              0xFFFF832A))
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xFFFFFFFF)
                        ),
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
