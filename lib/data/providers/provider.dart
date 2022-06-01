import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:warikan_app/ui/viewmodels/calc_overview_viewmodel.dart';
import 'package:warikan_app/ui/viewmodels/home_viewmodel.dart';
import 'package:warikan_app/ui/viewmodels/sign_in_viewmodel.dart';
import 'package:warikan_app/ui/viewmodels/sign_up_viewmodel.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [];
List<SingleChildWidget> dependentModels = [];
List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider(
    create: (_) => SignUpViewModel(),
  ),
  ChangeNotifierProvider(
    create: (_) => SignInViewModel(),
  ),
  ChangeNotifierProvider(
    create: (_) => HomeViewModel(),
  ),
  ChangeNotifierProvider(
    create: (_) => CalcOverviewViewModel(),
  ),
];
