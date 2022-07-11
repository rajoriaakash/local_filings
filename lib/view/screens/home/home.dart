import 'package:flutter/material.dart';
import 'package:local_filings/dimensions.dart';
import 'package:local_filings/shared_constants.dart';
import 'package:local_filings/view/base/custom_app_bar.dart';
import 'package:local_filings/view/base/custom_bottom_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Map list for all services UI
  List allServices = SharedConstants.allServices;
  //Map list for popular services UI
  List popularServices = SharedConstants.popularServices;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackButtonExist: false,
        title: "Local Filings",
        centredTitle: true,
        isSearchBarExist: true,
        isNotificationButtonExist: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.getHeight(context, 25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //LLP Registration Card
              Container(
                height: Dimensions.getHeight(context, 160),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.zero,
                child: Card(
                  color: Theme.of(context).colorScheme.primary,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.getWidth(context, 16),
                        vertical: Dimensions.getHeight(context, 16)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            flex: 66,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RichText(
                                    text: const TextSpan(
                                        children: [
                                      TextSpan(
                                          text: "LLP Registration\n",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              height: 1.3)),
                                      TextSpan(
                                          text: "Register your LLP from\n"),
                                      TextSpan(
                                          text: "Rs. 2999",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: "+GST")
                                    ],
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                        elevation:
                                            MaterialStateProperty.all(0)),
                                    child: Text(
                                      "Get Started",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ))
                              ],
                            )),
                        Expanded(
                            flex: 33,
                            child: Image.asset(
                                "assets/images/LLP_Registration.png"))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: Dimensions.getHeight(context, 30),
                    bottom: Dimensions.getHeight(context, 16)),
                child: const Text(
                  "All Services",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              //All Services list
              GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, childAspectRatio: 0.8),
                  itemCount: allServices.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, allServices[index]["route"]);
                          },
                          heroTag: "Service${index + 1}",
                          child: Image.asset(
                            allServices[index]["logoUrl"],
                            height: Dimensions.getHeight(context, 50),
                          ),
                        ),
                        SizedBox(height: Dimensions.getHeight(context, 10)),
                        Text(
                          allServices[index]["name"],
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 11,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    );
                  }),
              SizedBox(height:Dimensions.getHeight(context, 20)),
              const Text(
                "Popular Services",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              //Popular Services List
              Container(
                height: Dimensions.getHeight(context, 186),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const ScrollPhysics(),
                    itemCount: popularServices.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, popularServices[index]["routeName"]);
                        },
                        child: Container(
                            height: Dimensions.getHeight(context, 154),
                            width: Dimensions.getWidth(context, 253),
                            margin: EdgeInsets.only(
                              top: Dimensions.getHeight(context, 16),
                              bottom: Dimensions.getHeight(context, 16),
                              right: Dimensions.getWidth(context, 16),
                            ),
                            child: Image.asset(popularServices[index]
                                ["serviceIllustrationURL"])),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      //Navigation Bar
      bottomNavigationBar: CustomBottomBar(
        index: SharedConstants.bottomBarIndex["home"],
      ),
    );
  }
}
