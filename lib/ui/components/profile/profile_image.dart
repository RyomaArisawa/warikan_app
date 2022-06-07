import 'package:flutter/material.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 70,
          backgroundImage: NetworkImage(
              "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
        ),
        Positioned(
          bottom: 1,
          right: 1,
          child: Container(
            height: 40,
            width: 40,
            child: const Icon(
              Icons.add_a_photo,
              color: Colors.white,
            ),
            decoration: const BoxDecoration(
              color: CustomColors.darkBlue,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
