import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:warikan_app/ui/components/common/style/indigo_list_card.dart';

class SettingListCard extends StatelessWidget {
  const SettingListCard({Key? key, required this.title, required this.onTap})
      : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IndigoListCard(
      onTap: onTap,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: const Icon(
          IconlyLight.arrow_right_2,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
