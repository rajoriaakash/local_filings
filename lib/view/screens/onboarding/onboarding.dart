import 'package:flutter/material.dart';
import 'package:local_filings/provider/onboarding_provider.dart';
import 'package:provider/provider.dart';

import 'onboarding_widget.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    final onBoarding = Provider.of<OnBoardingProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return OnBoardingWidget();
              },
              onPageChanged: (index) => onBoarding.setSelectIndex(index),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: (){
                      if(onBoarding.selectedIndex!=0){
                        onBoarding.setSelectIndex(onBoarding.selectedIndex-1);
                      }
                    },
                    child: Text(
                      "prev",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF0E3C6E)
                      ),
                    )
                ),
                ElevatedButton(
                    onPressed: (){
                      if(onBoarding.selectedIndex!=2){
                        onBoarding.setSelectIndex(onBoarding.selectedIndex+1);
                      }
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Color(0xFFFF832A))
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFFFFFFF)
                      ),
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
