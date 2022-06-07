import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';
import 'package:warikan_app/ui/viewmodels/profile_viewmodel.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();

    return Stack(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: (vm.image != null)
              ? Image.file(vm.image!).image
              : const NetworkImage(
                  "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
        ),
        Positioned(
          bottom: 1,
          right: 1,
          child: Container(
            height: 40,
            width: 40,
            child: GestureDetector(
              onTap: vm.setImage,
              child: const Icon(
                Icons.add_a_photo,
                color: Colors.white,
              ),
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
