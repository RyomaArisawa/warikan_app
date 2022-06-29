import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';
import 'package:warikan_app/ui/viewmodels/calc_input_viewmodel.dart';

class MemberNameButtons extends StatelessWidget {
  const MemberNameButtons({Key? key, required this.controller})
      : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CalcInputViewModel>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            alignment: const Alignment(0, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ButtonBar(
                buttonPadding: const EdgeInsets.only(left: 6),
                children: vm.members
                    .map(
                      (member) => ElevatedButton(
                        onPressed: () {
                          vm.members.asMap().forEach((index, e) {
                            if (e.name == member.name) {
                              _buildAnimateToPage(index);
                              return;
                            }
                          });
                        },
                        child: Text(
                          member.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        style: ElevatedButton.styleFrom(
                            side: const BorderSide(color: Colors.white),
                            primary: CustomColors
                                .indigo //CustomColors.darkBlue.withOpacity(0.8),
                            ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildAnimateToPage(int index) => controller.animateToPage(index,
      duration: const Duration(milliseconds: 400), curve: Curves.fastOutSlowIn);
}
