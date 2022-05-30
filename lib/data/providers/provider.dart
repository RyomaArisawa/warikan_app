import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
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
];
