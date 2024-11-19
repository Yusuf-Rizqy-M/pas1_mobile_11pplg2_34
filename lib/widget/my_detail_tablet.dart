import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/task_controller.dart';
import '../model/model_bola.dart';
import 'my_image_network.dart';
import 'my_text.dart';

class MyDetailTablet extends StatelessWidget {
  final String image;
  final String team;
  final String teamshort;

  const MyDetailTablet({
    Key? key,
    required this.image,
    required this.team,
    required this.teamshort,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final TaskController favoriteController = Get.find<TaskController>();
    final modelFav = ModelBola(
      strTeam: team,
      strStadium: teamshort,
      strBadge: image,
    );

    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyImageNetwork(
              imageUrl: image,
              width: 65,
              height: 65,
              borderRadius: 8.0,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    hintText: team,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    colors: Colors.black87,
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Icon(
                        Icons.short_text,
                        color: Colors.blueAccent,
                        size: 16.0,
                      ),
                      SizedBox(width: 4.0),
                      MyText(
                        hintText: teamshort,
                        fontSize: 14.0,
                        colors: Colors.grey[600]!,
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Obx(() {
                      final isFavorite = favoriteController.isFavorite(modelFav);
                      return IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.blueAccent,
                        ),
                        onPressed: () {
                          if (isFavorite) {
                            favoriteController.removeFavorite(modelFav);
                          } else {
                            favoriteController.addFavorite(modelFav);
                          }
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
