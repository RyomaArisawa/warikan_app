import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';
import 'package:warikan_app/data/util/formatter.dart';
import 'package:warikan_app/ui/viewmodels/calc_input_viewmodel.dart';

class DisplayTotalCard extends StatelessWidget {
  ///合計金額表示コンポーネント
  const DisplayTotalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CalcInputViewModel>();
    return Container(
      height: 40.0,
      decoration: BoxDecoration(
        color: CustomColors.darkBlue.withOpacity(0.8),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.white),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Center(
        child: Text(
          "Total: ￥${Formatter.numberFormatter.format(vm.totalAmount)}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
