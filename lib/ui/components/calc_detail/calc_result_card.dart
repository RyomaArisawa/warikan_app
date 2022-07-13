import 'package:flutter/material.dart';
import 'package:split/data/consts/custom_colors.dart';
import 'package:split/data/consts/texts.dart';
import 'package:split/data/models/calc_result.dart';
import 'package:split/data/util/formatter.dart';
import 'package:split/ui/components/common/style/bottom_shader.dart';

class CalcResultCard extends StatelessWidget {
  const CalcResultCard({Key? key, required this.calcResultsPerMember})
      : super(key: key);

  final List<CalcResult?> calcResultsPerMember;
  @override
  Widget build(BuildContext context) {
    return calcResultsPerMember.isNotEmpty
        ? BottomShader(
            child: ListView.builder(
              itemCount: calcResultsPerMember.length,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: CustomColors.indigo),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To:  ${calcResultsPerMember[index]?.receiver}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Amount:  ${Formatter.formatCost(calcResultsPerMember[index]?.amount ?? 0)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : const Center(
            child: Text(
              DisplayTexts.noDebt,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
