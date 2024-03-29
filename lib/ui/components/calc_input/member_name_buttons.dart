import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/ui/components/common/custom_button.dart';
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
                      (member) => CustomButton(
                        width: MediaQuery.of(context).size.width / 3.4,
                        height: 40,
                        text: member.name,
                        onPressed: () {
                          vm.members.asMap().forEach((index, e) {
                            if (e.name == member.name) {
                              vm.scrollPage(index, controller);
                              return;
                            }
                          });
                        },
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
}
