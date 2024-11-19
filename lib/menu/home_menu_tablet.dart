import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_34/widget/my_detail_tablet.dart';
import '../Api/Api_Controller.dart';
import '../controller/task_controller.dart';
import '../model/model_bola.dart';
import '../widget/my_image.dart';
import '../widget/my_image_network.dart';
import '../widget/my_text.dart';

class HomeMenuTablet extends StatelessWidget {
  final ApiController teamController = Get.put(ApiController());
  final TaskController favoriteController = Get.find<TaskController>();

  HomeMenuTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (teamController.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: Colors.blue));
        }
        return ListView.builder(
          itemCount: teamController.postList.length,
          itemBuilder: (context, index) {
            final post = teamController.postList[index];
            return GestureDetector(
                onTap: () => Get.toNamed('/detailhometablet', arguments: post),
                child: MyDetailTablet(
                    image: post.strBadge,
                    team: post.strTeam,
                    teamshort: post.strTeamShort));
          },
        );
      }),
    );
  }
}
