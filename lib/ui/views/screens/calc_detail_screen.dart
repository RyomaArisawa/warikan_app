import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:warikan_app/data/consts/custom_colors.dart';
import 'package:warikan_app/data/consts/texts.dart';
import 'package:warikan_app/ui/components/calc_detail/calc_detail_card.dart';
import 'package:warikan_app/ui/components/calc_detail/display_total_card.dart';
import 'package:warikan_app/ui/components/common/cutom_app_bar.dart';
import 'package:warikan_app/ui/components/common/style/body_background.dart';
import 'package:warikan_app/ui/components/common/wide_button.dart';
import 'package:warikan_app/ui/viewmodels/calc_detail_viewmodel.dart';

class CalcDetailScreen extends StatefulWidget {
  ///CalcDetail画面
  const CalcDetailScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const CalcDetailScreen(),
    );
  }

  @override
  State<CalcDetailScreen> createState() => _CalcDetailScreenState();
}

class _CalcDetailScreenState extends State<CalcDetailScreen> {
  final controller = PageController(viewportFraction: 0.9, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final vm = context.read<CalcDetailViewModel>();
    return Scaffold(
      appBar: const CustomAppBar(
        title: ScreenLabels.calc,
      ),
      body: BodyBackground(
        child: Column(
          children: [
            const DisplayTotalCard(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: vm.split.members.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CalcDetailCard(
                      memberIndex: index,
                    ),
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: vm.split.members.length,
              effect: const ScrollingDotsEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: CustomColors.darkBlue,
                dotColor: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            WideButton(
                height: 40,
                text: ButtonLabels.complete,
                onPressed: () => vm.showCompleteDialog(context)),
          ],
        ),
      ),
    );
  }
}
