import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_34/Api/Api_Controller.dart';
import 'package:pas1_mobile_11pplg2_34/widget/my_image_network.dart';

import '../widget/my_text.dart';

class DetailHomeTablet extends StatelessWidget {
  final ApiController musicController = Get.put(ApiController());
  final post = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: MyText(
          hintText: 'Detail Teams',
          fontSize: 20.0,
          colors: Colors.white,
        ),
      ),
      body: Obx(() {
        if (musicController.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: Colors.blue));
        }
        return SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  MyImageNetwork(
                    imageUrl: post.strBadge,
                    width: 180,
                    height: 180,
                    borderRadius: 30,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 20),
                  MyText(
                    hintText: post.strTeam,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    colors: Colors.black,
                    fontFamily: 'Montserrat',
                  ),
                  MyText(
                    hintText: 'Stadium : ${post.strStadium}',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    colors: Colors.red,
                  ),
                  SizedBox(height: 8),
                  MyText(
                    hintText: post.strDescriptionEN,
                    fontSize: 12,
                    colors: Colors.black,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
